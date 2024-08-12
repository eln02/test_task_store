import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_store/ui/state/products/products_provider.dart';

class MySearchBar extends ConsumerStatefulWidget {
  const MySearchBar({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<MySearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {context.pop();},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Введите название товара',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                ref.read(productProvider.notifier).searchProducts(value);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
