import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/presentation/routing/app_routing.dart';
import 'package:test_task_store/presentation/products/widgets/product_card.dart';

import '../../domain/models/my_product.dart';
import '../state/products/products_provider.dart';

class FavoriteProductsPage extends ConsumerWidget {
  const FavoriteProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoaded = ref.watch(productProvider).isLoaded;

    Widget content;

    if (!isLoaded) {
      content = const Center(child: CircularProgressIndicator());
    } else {
      content = const _FavoriteProducts();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Избранные',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            content,
          ],
        ),
      ),
    );
  }
}

class _FavoriteProducts extends ConsumerStatefulWidget {
  const _FavoriteProducts();

  @override
  _FavoriteProductsState createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends ConsumerState<_FavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    final List<Product> productSelection =
        ref.read(productProvider).selectedProducts;
    ref.read(goRouterProvider).routeInformationProvider.addListener(() {
      setState(() {});
    });

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          children: List.generate(
            productSelection.length,
            (index) => ProductCard(product: productSelection[index]),
          ),
        ),
      ),
    );
  }
}
