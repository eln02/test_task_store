import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/ui/products/product_card.dart';

import '../../domain/models/my_product.dart';
import '../state/products/products_provider.dart';
import 'app_bar.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> products = ref.watch(productProvider).myProducts;
    final bool isLoaded = ref.watch(productProvider).isLoaded;

    Widget content = Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        children: List.generate(
          products.length,
          (index) => ProductCard(product: products[index]),
        ),
      ),
    );

    if (!isLoaded) {
      content = const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //const MySearchBar(),
            const TopBar(),
            content,
          ],
        ),
      ),
    );
  }
}
