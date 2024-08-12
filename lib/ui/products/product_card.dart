import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/my_product.dart';
import '../routing/app_routing.dart';
import '../state/products/products_provider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite =
        ref.watch(productProvider).selectedProducts.contains(product);

    return InkWell(
      onTap: () {
        var f = (ref.read(goRouterProvider).routeInformationProvider.value.state
            as Map<dynamic, dynamic>)['location'];
        context.go('$f/detail/${product.id}');
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth / 2 - 16,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(
                          'https://shop.mango.com/assets/rcs/pics/static/T6/fotos/S/67021012_05_D3.jpg?imwidth=960&imdensity=1&ts=1702458196292'),
                      IconButton(
                          icon: Icon(isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {
                            ref
                                .read(productProvider.notifier)
                                .toggleFavorite(product);
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name,
                        style: const TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
