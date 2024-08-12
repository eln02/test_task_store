import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

import '../../../data/models/products_db.dart';
import '../../../data/repositories/product_repository_drift.dart';
import '../../../data/services/mock_web_service.dart';
import '../../../domain/models/my_product.dart';
import 'auth_state.dart';

class MyStateController extends StateNotifier<ProductState> {
  MyStateController(super.state);

  ProductRepositoryDrift productRepositoryImpl = ProductRepositoryDrift(
      database: ProductDatabase(), productsRepository: MockWebService());

  Future<void> refreshData() async {
    state = state.copyWith(isLoaded: false);
    await productRepositoryImpl.updateProducts();
    state = state.copyWith(
        myProducts: await productRepositoryImpl.getAllProducts(),
        selectedProducts: await productRepositoryImpl.getFavoriteProducts(),
        isLoaded: true);
  }

  Future<void> toggleFavorite(Product product) async {
    productRepositoryImpl.toggleFavorite(product.id);

    if (state.selectedProducts.contains(product)) {
      //разлайкнули
      state = state.copyWith(
        selectedProducts: List.from(state.selectedProducts)..remove(product),
      );
    } else {
      state = state.copyWith(
        selectedProducts: List.from(state.selectedProducts)..insert(0, product),
      );
    }
  }

  Product getProductById(String id) {
    Product product =
    state.myProducts.where((p) => p.id.toString() == id).toList()[0];
    return product;
  }

  Future<void> searchProducts(String name) async {
    List<Product> s = [];
    for (var product in state.myProducts) {
      var similarityScore = tokenSortRatio(name, product.name);
      if (similarityScore > 60) {
        s.add(product);
      }
    }
    state = state.copyWith(searchResults: s);
  }
}