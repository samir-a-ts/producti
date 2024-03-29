import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:producti/data/core/error/error_codes.dart';
import 'package:producti/data/core/error/failure.dart';
import 'package:producti/domain/notifications/notification.dart';
import 'package:producti/domain/notifications/notification_repository.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdb;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

@lazySingleton
class LocalNotificationRepository extends NotificationRepository {
  static const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_notification_icon');
  static const IOSInitializationSettings _initializationSettingsIOS =
      IOSInitializationSettings();
  static const InitializationSettings _initializationSettings =
      InitializationSettings(
    android: _initializationSettingsAndroid,
    iOS: _initializationSettingsIOS,
  );

  static const _notificationsDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'com.ludev.producti.notifications',
      'main_notifications',
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.high,
    ),
    iOS: IOSNotificationDetails(),
  );

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  final IOSFlutterLocalNotificationsPlugin _iosFlutterLocalNotificationsPlugin;

  LocalNotificationRepository(
    this._flutterLocalNotificationsPlugin,
    this._iosFlutterLocalNotificationsPlugin,
  );

  @override
  Future<Either<Failure, void>> setup(
    void Function(String?) onSelectNotification,
  ) async {
    final initializationResult =
        await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: onSelectNotification,
    );

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();

    tzdb.initializeTimeZones();

    tz.setLocalLocation(
      tz.getLocation(currentTimeZone),
    );

    if (!initializationResult!) {
      if (Platform.isIOS) {
        final permissionRequestResult =
            await _iosFlutterLocalNotificationsPlugin.requestPermissions(
          sound: true,
          alert: true,
          badge: true,
        );

        if (permissionRequestResult!) return setup(onSelectNotification);
      }

      return left(
        const NotificationFailure(
          ErrorCode.notificationsInitializationFailure,
        ),
      );
    }

    return right(null);
  }

  @override
  Future<void> setNotification(
    Notification notification, {
    required int tableIndex,
  }) async {
    final time = notification.time;

    final title = notification.title;
    final body = notification.body;

    return _flutterLocalNotificationsPlugin.zonedSchedule(
      notification.id,
      title.length > 40 ? title.substring(0, 38) + '...' : title,
      body.length > 40 ? body.substring(0, 38) + '...' : body,

      /// Material guidelines accepted.
      tz.TZDateTime(
        tz.local,
        time.year,
        time.month,
        time.day,
        time.hour,
        time.minute,
        time.second + 1,
      ),
      _notificationsDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
      payload: notification.pathToNotification.toRawString(tableIndex),
    );
  }

  @override
  Future<void> deleteNotifications(List<int> ids) => Future.wait(
        ids
            .map(
              (e) => _flutterLocalNotificationsPlugin.cancel(e),
            )
            .toList(),
      );

  @override
  Future<NotificationAppLaunchDetails?> getAppLaunchDetails() =>
      _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
}
