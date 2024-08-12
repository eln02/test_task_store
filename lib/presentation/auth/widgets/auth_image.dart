import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/cat.jpg',
      height: 150,
      width: 150,
      fit: BoxFit.contain, // Опционально
    );
  }
}
