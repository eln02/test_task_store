import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 54)),
        backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF3461FD)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

      ),
      onPressed: onPressed,
      child: Text(buttonText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}
