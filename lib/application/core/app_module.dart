import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:producti/domain/table/table.dart';
import 'package:hive/hive.dart';

@module
abstract class AppModule {
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  FirebaseAuth get authentication => FirebaseAuth.instance;

  FirebaseFirestore get store => FirebaseFirestore.instance;

  FirebaseAnalytics get analytics => FirebaseAnalytics();

  FlutterSecureStorage get secureStorage => FlutterSecureStorage();

  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<Box<Table>> get tablesBox => Hive.openBox<Table>('APP_TABLES');

  @preResolve
  Future<Box<List<String>>> get constantsBox =>
      Hive.openBox<List<String>>('APP_CONSTANTS');
}
