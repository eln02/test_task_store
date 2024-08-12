import '../../domain/models/my_product.dart';

abstract class WebService {
  Future<List<Product>> getProducts();
}
