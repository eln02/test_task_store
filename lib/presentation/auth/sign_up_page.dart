import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/presentation/auth/widgets/auth_image.dart';
import 'package:test_task_store/presentation/state/auth/auth_provider.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_hint.dart';
import 'widgets/auth_text.dart';
import 'widgets/auth_text_button.dart';
import 'widgets/auth_input_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _loginController;
  late TextEditingController _mailController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _loginController = TextEditingController();
    _mailController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      ref.read(authProvider.notifier).signUp(_loginController.text,
          _mailController.text, _passwordController.text);
      context.go('/notes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CatImage(),
                const AuthText(
                  text: "Вход",
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  hintText: "Почта",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите адрес электронной почты';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Пожалуйста, введите действительный адрес электронной почты';
                    }
                    return null;
                  },
                  controller: _mailController,
                ),
                CustomInputField(
                  hintText: "Логин",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите логин';
                    }
                    RegExp regex = RegExp(r'^[a-z0-9]+$');
                    if (!regex.hasMatch(value)) {
                      return 'Допустимы только маленькие латинские буквы и цифры';
                    }
                    if (value.length < 5) {
                      return 'Длина логина должна быть как минимум 5 символов';
                    }
                    if (value.length > 64) {
                      return 'Длина логина должна быть не более 64 символов';
                    }
                    return null;
                  },
                  controller: _loginController,
                ),
                CustomInputField(
                  hintText: "Пароль",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    if (value.length < 8) {
                      return 'Ненадежный пароль';
                    }
                    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])')
                        .hasMatch(value)) {
                      return 'Пароль должен содержать как минимум одну цифру и одну букву латинского алфавита';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: _passwordController,
                ),
                CustomInputField(
                  hintText: "Повторите пароль",
                  validator: (value) {
                    if ((value == null || value.isEmpty) ||
                        value != _passwordController.text) {
                      return 'Пароли не совпадают';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                MyButton(
                    buttonText: 'Зарегистрироваться',
                    onPressed: () {
                      signUp();
                    }),
                AuthTextButton(
                    buttonText: 'Войти',
                    onPressed: () {
                      context.go('/sign_in');
                    }),
                const Hint()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
