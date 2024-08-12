import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          const Expanded(child: Text('Товары')),
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
