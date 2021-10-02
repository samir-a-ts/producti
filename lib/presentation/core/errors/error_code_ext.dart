import 'package:flutter/cupertino.dart';
import 'package:producti/data/core/error/error_codes.dart';
import 'package:producti/generated/l10n.dart';

extension ErrorCodeExt on ErrorCode {
  String translate(BuildContext context) {
    final intl = S.of(context);

    switch (this) {
      case ErrorCode.emailAlreadyInUse:
        return intl.emailAlreadyInUse;
      case ErrorCode.userRemoved:
        return intl.userRemoved;
      case ErrorCode.userNotExists:
        return intl.userNotExists;
      case ErrorCode.wrongPassword:
        return intl.wrongPassword;
      case ErrorCode.userNotLoggedIn:
        return intl.userNotLoggedIn;
      case ErrorCode.invalidEmail:
        return intl.invalidEmail;
      case ErrorCode.invalidPassword:
        return intl.invalidPassword;
      case ErrorCode.passwordsNotMatch:
        return intl.passswordsNotMatch;
      case ErrorCode.voidValue:
        return intl.voidValue;
      case ErrorCode.invalidLink:
        return intl.invalidLink;
      case ErrorCode.failedToFetchUserData:
        return intl.failedToFetchUserData;
      case ErrorCode.notConnectedToInternet:
        return intl.notConnectedToInternet;
    }
  }
}
