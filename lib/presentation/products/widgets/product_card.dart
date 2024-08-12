import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/my_product.dart';
import '../../routing/app_routing.dart';
import '../../state/products/products_provider.dart';

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
            width: constraints.maxWidth / 2 - 8,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: DecorationImage(
                            image: NetworkImage(product.url),
                            fit: BoxFit
                                .cover,
                          ),
                        ),
                        width: constraints.maxWidth,
                        height: constraints
                            .maxWidth,
                      ),
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(product.name,
                          style: const TextStyle(fontSize: 16)),
                    ),
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
