import '../../domain/models/my_product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();

  Future<List<Product>> getFavoriteProducts();

  Future<void> updateProducts();

  Future<void> toggleFavorite(int id);
}
