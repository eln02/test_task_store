import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Expanded(child: Text('Товары', style: TextStyle(fontSize:20),)),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.go('/notes/search');
            },
          ),
        ],
      ),
    );
  }
}
