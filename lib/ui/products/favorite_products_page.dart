import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/ui/routing/app_routing.dart';
import 'package:test_task_store/ui/products/product_card.dart';

import '../../domain/models/my_product.dart';
import '../state/products/products_provider.dart';

class FavoriteProductsPage extends ConsumerWidget {
  const FavoriteProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoaded = ref.watch(productProvider).isLoaded;

    Widget content;

    if (!isLoaded) {
      content = Center(child: CircularProgressIndicator());
    } else {
      content = const FavoriteProducts();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            content,
          ],
        ),
      ),
    );
  }
}

class FavoriteProducts extends ConsumerStatefulWidget {
  const FavoriteProducts({Key? key}) : super(key: key);

  @override
  _FavoriteProductsState createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends ConsumerState<FavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    final List<Product> productSelection =
        ref.read(productProvider).selectedProducts;
    ref.read(goRouterProvider).routeInformationProvider.addListener(() {
      setState(() {});
    });

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        children: List.generate(
          productSelection.length,
          (index) => ProductCard(product: productSelection[index]),
        ),
      ),
    );
  }
}
