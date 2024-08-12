import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/ui/products/product_card.dart';
import 'package:test_task_store/ui/products/search_bar.dart';

import '../state/products/products_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var productSelection = ref.watch(productProvider).searchResults;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MySearchBar(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                children: List.generate(
                  productSelection.length,
                      (index) => ProductCard(product: productSelection[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
