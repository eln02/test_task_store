import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/ui/state/products/products_provider.dart';

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
            const ProductPicture(),
            Text(product.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}



class ProductPicture extends StatelessWidget {
  const ProductPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://shop.mango.com/assets/rcs/pics/static/T6/fotos/S/67021012_05_D3.jpg?imwidth=960&imdensity=1&ts=1702458196292'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {Navigator.pop(context);},
            ),
          ),
        ],
      ),
    );
  }
}

