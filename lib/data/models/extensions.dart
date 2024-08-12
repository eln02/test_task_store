import 'package:test_task_store/data/models/products_db.dart';


import '../../domain/models/my_product.dart';

extension MyProductToFavProductExtension on MyProduct {
  Product toFavProduct() {
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      isFavorite: isFavorite,
      url: url
    );
  }
}

extension FavProductToMyProduct on Product {
  MyProduct toMyProduct() {
    return MyProduct(
        id: id,
        name: name,
        price: price,
        description: description,
        isFavorite: isFavorite,
        url: url);
  }
}


