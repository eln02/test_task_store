import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorMaxLines: 2,
          filled: true,
          fillColor: Colors.blue.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
