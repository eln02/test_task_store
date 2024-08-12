import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/presentation//auth/widgets/auth_button.dart';
import 'package:test_task_store/presentation/auth/widgets/auth_image.dart';
import 'package:test_task_store/presentation/auth/widgets/auth_text.dart';
import 'package:test_task_store/presentation/auth/widgets/auth_text_button.dart';
import 'package:test_task_store/presentation/state/auth/auth_provider.dart';
import 'widgets/auth_hint.dart';
import 'widgets/auth_input_field.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _loginController;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _loginController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _loginController.dispose();
    super.dispose();
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      bool isSignedIn = ref
          .read(authProvider.notifier)
          .signIn(_loginController.text, _passwordController.text);
      if (isSignedIn) {
        context.go('/notes');
      } else {}
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
              children: [
                const SizedBox(
                  height: 80,
                ),
                const CatImage(),
                const AuthText(
                  text: "Вход",
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: isVisible,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(7),
                          color: Colors.red[100],
                          width: constraints.maxWidth,
                          child: Center(
                            child: Text(
                              'Неверный логин или пароль',
                              style: TextStyle(color: Colors.red[700]),
                            ),
                          ),
                        );
                      },
                    )),
                CustomInputField(
                  hintText: "Логин",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите логин';
                    } else {
                      setState(() {
                        isVisible = true;
                      });
                      return null;
                    }
                  },
                  controller: _loginController,
                ),
                CustomInputField(
                  hintText: "Пароль",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: _passwordController,
                ),
                MyButton(
                    buttonText: 'Войти',
                    onPressed: () {
                      signIn();
                    }),
                AuthTextButton(
                    buttonText: 'Зарегистрироваться',
                    onPressed: () {
                      context.go('/sign_up');
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
