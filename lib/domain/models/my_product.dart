class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String url;
  bool isFavorite;

  Product({
    required this.id,
    this.isFavorite = false,
    required this.description,
    required this.price,
    required this.name,
    required this.url,
  });

  // Метод copyWith для клонирования и возможности изменения некоторых полей
  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    String? url,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      url: url ?? this.url
    );
  }

  // Переопределение метода ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.isFavorite == isFavorite &&
        other.url == url;
  }

  // Переопределение метода hashCode
  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    price.hashCode ^
    description.hashCode ^
    isFavorite.hashCode ^
    url.hashCode;
  }
}



