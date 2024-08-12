import '../../../domain/models/my_product.dart';

class ProductState {
  List<Product> myProducts;
  List<Product> selectedProducts;
  List<Product> searchResults;
  bool isLoaded;

  ProductState(
      {required this.myProducts,
        required this.selectedProducts,
        required this.searchResults,
        required this.isLoaded});

  ProductState copyWith({
    List<Product>? myProducts,
    List<Product>? selectedProducts,
    List<Product>? searchResults,
    String? searchQuery,
    bool? isLoaded,
  }) {
    return ProductState(
        myProducts: myProducts ?? this.myProducts,
        selectedProducts: selectedProducts ?? this.selectedProducts,
        searchResults: searchResults ?? this.searchResults,
        isLoaded: isLoaded ?? this.isLoaded);
  }
}
