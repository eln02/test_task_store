import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/ui/state/auth/auth_provider.dart';
import 'input_field.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _loginController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Вход",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              CustomInputField(
                hintText: "Логин",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите логин';
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
                  return null;
                },
                obscureText: true,
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bool isSignedIn = ref.read(authProvider.notifier).signIn(
                        _loginController.text, _passwordController.text);
                    if (isSignedIn) {
                      context.go('/notes');
                    } else {}
                  }
                },
                child: const Text("Войти"),
              ),
              TextButton(
                  onPressed: () {
                    context.go('/sign_up');
                  },
                  child: Text("Зарегистрироваться"))
            ],
          ),
        ),
      ),
    );
  }
}
