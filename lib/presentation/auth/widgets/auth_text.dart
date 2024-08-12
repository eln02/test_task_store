import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  final String text;

  const AuthText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
        color: Color(0xFF3461FD),
      ),
    );
  }
}

