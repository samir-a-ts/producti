import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:producti/application/core/error/error_codes.dart';
import 'package:producti/application/core/error/failure.dart';
import 'package:producti/domain/auth/auth_repository.dart';
import 'package:producti/domain/auth/user.dart';
import 'package:producti/domain/auth/values/email.dart';
import 'package:producti/domain/auth/values/password.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignIn) {
      yield AuthLoadingState();

      final result = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      yield result.fold(
        (failure) => AuthErrorState(failure),
        (user) => AuthLoggedIn(user),
      );
    }

    if (event is AuthSignUp) {
      yield AuthLoadingState();

      final password = event.password.getOrCrash();
      final repeatPassword = event.repeatPassword.getOrCrash();

      if (password == repeatPassword) {
        final result = await _authRepository.register(
          email: event.email,
          password: event.password,
        );

        yield result.fold(
          (failure) => AuthErrorState(failure),
          (user) => AuthLoggedIn(user),
        );
      } else {
        yield AuthErrorState(
          ValidationFailure(
            ErrorCode.passwordsNotMatch,
          ),
        );
      }
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
