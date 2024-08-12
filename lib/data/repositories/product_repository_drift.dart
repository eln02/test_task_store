import 'package:drift/drift.dart';
import 'package:test_task_store/data/models/extensions.dart';
import 'package:test_task_store/data/models/products_db.dart';
import 'package:test_task_store/data/repositories/abstract_product_repository.dart';

import '../../domain/models/my_product.dart';
import '../services/mock_web_service.dart';

class ProductRepositoryDrift implements ProductRepository {
  final ProductDatabase database;
  final MockWebService productsRepository;

  ProductRepositoryDrift(
      {required this.database, required this.productsRepository});

  @override
  Future<List<Product>> getAllProducts() async {
    List<MyProduct> myProducts =
        await database.select(database.myProducts).get();
    List<Product> allProducts =
        myProducts.map((product) => product.toFavProduct()).toList();
    return allProducts;
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    List<MyProduct> myProducts = await (database.select(database.myProducts)
          ..where((product) => product.isFavorite.equals(true)))
        .get();

    List<Product> selectedProducts =
        myProducts.map((product) => product.toFavProduct()).toList();

    return selectedProducts;
  }

  @override
  Future<void> updateProducts() async {
    List<Product> products = await productsRepository.getProducts();

    for (var i in products) {
      try {
        //если продукт уже есть, то нужно оставить старый isFavorite
        MyProduct product = await (database.select(database.myProducts)
              ..where((product) => product.id.equals(i.id)))
            .getSingle();

        var n = i.copyWith(isFavorite: product.isFavorite).toMyProduct();

        await database
            .into(database.myProducts)
            .insert(i.toMyProduct(), onConflict: DoUpdate((old) => n));
      } catch (e) {
        database.into(database.myProducts).insert(i.toMyProduct());
      }
    }
  }

  @override
  Future<void> toggleFavorite(int id) async {
    MyProduct product = await (database.select(database.myProducts)
          ..where((product) => product.id.equals(id)))
        .getSingle();

    database.update(database.myProducts)
      ..where((product) => product.id.equals(id))
      ..write(product.copyWith(isFavorite: !product.isFavorite));
  }
}
