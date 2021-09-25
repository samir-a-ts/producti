import 'package:flutter/material.dart';
import 'package:producti/application/auth/pages/auth_page_cubit.dart';
import 'package:producti/domain/auth/values/email.dart';
import 'package:producti/domain/auth/values/password.dart';
import 'package:producti/generated/l10n.dart';
import 'package:producti/presentation/auth/widgets/password_text_field.dart';
import 'package:producti_ui/producti_ui.dart';
import 'package:producti/presentation/core/errors/error_code_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    final intl = S.of(context);

    final cubit = context.read<AuthPageCubit>();

    final _email = TextEditingController();
    final _password = TextEditingController();
    final _repeatPassword = TextEditingController();

    _email.addListener(() {
      cubit.mutate(
        email: Email(_email.text),
      );
    });

    _password.addListener(() {
      cubit.mutate(
        password: Password(_password.text),
      );
    });

    _repeatPassword.addListener(() {
      cubit.mutate(
        repeatPassword: Password(_repeatPassword.text),
      );
    });

    return Column(
      children: [
        Text(
          intl.funBegins,
          style: textTheme.subtitle1,
        ),
        const Gap(size: 12),
        Text(
          intl.signUp,
          style: textTheme.headline3,
        ),
        const Gap(size: 14),
        TextInputWidget(
          prefixIcon: Icons.email,
          hintText: intl.email,
          controller: _email,
        ),
        const Gap(size: 10),
        BlocBuilder<AuthPageCubit, AuthPageState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return state.enableValidation
                ? state.email.validatedValue.fold(
                    (failure) => Align(
                      alignment: Alignment.centerLeft,
                      child: FieldErrorIndicator(
                        message: failure.messageCode.translate(context),
                      ),
                    ),
                    (r) => const SizedBox(),
                  )
                : const SizedBox();
          },
        ),
        const Gap(size: 14),
        PasswordTextField(
          controller: _password,
          hintText: intl.password,
        ),
        const Gap(size: 7),
        BlocBuilder<AuthPageCubit, AuthPageState>(
          buildWhen: (previous, current) =>
              previous.password != current.password ||
              previous.enableValidation != previous.enableValidation,
          builder: (context, state) {
            return state.enableValidation
                ? state.password.validatedValue.fold(
                    (failure) => FieldErrorIndicator(
                      message: failure.messageCode.translate(context),
                    ),
                    (r) => const SizedBox(),
                  )
                : const SizedBox();
          },
        ),
        const Gap(size: 14),
        PasswordTextField(
          controller: _repeatPassword,
          hintText: intl.repeatPassword,
        ),
        const Gap(size: 7),
        BlocBuilder<AuthPageCubit, AuthPageState>(
          buildWhen: (previous, current) =>
              previous.repeatPassword != current.repeatPassword ||
              previous.enableValidation != previous.enableValidation,
          builder: (context, state) {
            return state.enableValidation
                ? state.repeatPassword.validatedValue.fold(
                    (failure) => FieldErrorIndicator(
                      message: failure.messageCode.translate(context),
                    ),
                    (r) => const SizedBox(),
                  )
                : const SizedBox();
          },
        ),
        const Gap(size: 14),
        OptionText(
          start: intl.alreadyCoolGuy,
          end: ' ${intl.letHim}',
          onTap: () => cubit.togglePage(),
        ),
        const Gap(size: 6),
        OptionText(
          start: intl.hatePeople,
          end: ' ${intl.signInAnonim}',
          onTap: () {},
        ),
      ],
    );
  }
}
