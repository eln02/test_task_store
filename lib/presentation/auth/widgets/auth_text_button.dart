import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AuthTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(buttonText, style: TextStyle(color: Colors.grey.shade400),));
  }
}
