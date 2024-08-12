import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_store/presentation/products/widgets/product_card.dart';
import 'package:test_task_store/presentation/products/widgets/search_bar.dart';

import '../state/products/products_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  children: List.generate(
                    productSelection.length,
                        (index) => ProductCard(product: productSelection[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
