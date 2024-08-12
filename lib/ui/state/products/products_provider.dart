import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';
import 'auth_state.dart';




final productProvider =
    StateNotifierProvider<MyStateController, ProductState>((ref) {
  var n = MyStateController(ProductState(
      myProducts: [],
      selectedProducts: [],
      searchResults: [],
      isLoaded: false));
  return n;
});


