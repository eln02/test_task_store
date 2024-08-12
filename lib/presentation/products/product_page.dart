import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/presentation/state/products/products_provider.dart';

import '../../domain/models/my_product.dart';

class ProductPage extends ConsumerWidget {
  final String id;

  const ProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Product product = ref.watch(productProvider.notifier).getProductById(id);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductPicture(
              url: product.url,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Text(product.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  final String url;

  const _ProductPicture({required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
