import 'package:dartz/dartz.dart';
import 'package:producti/data/core/error/failure.dart';
import 'package:producti/domain/auth/user.dart';
import 'package:producti/domain/auth/values/email.dart';
import 'package:producti/domain/auth/values/password.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn({
    required Email email,
    required Password password,
  });

  Future<Either<Failure, User>> register({
    required Email email,
    required Password password,
  });
}
