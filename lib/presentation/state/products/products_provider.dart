import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'products_controller.dart';
import 'products_state.dart';




final productProvider =
    StateNotifierProvider<MyStateController, ProductState>((ref) {
  var n = MyStateController(ProductState(
      myProducts: [],
      selectedProducts: [],
      searchResults: [],
      isLoaded: false));
  return n;
});


