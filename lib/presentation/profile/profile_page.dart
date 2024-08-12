import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/presentation/state/auth/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.read(authProvider).name ?? '';
    final mail = ref.read(authProvider).mail ?? '';
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    _Avatar(letter: name[0]),
                    const SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
                          Text(mail),
                      ],),
                    ),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        ref.read(authProvider.notifier).exit();
                        context.go('/notes');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String letter;
  const _Avatar({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: Text(
            letter.toUpperCase(),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      );
  }
}

