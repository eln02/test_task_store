import '../../domain/models/my_product.dart';
import 'abstract_web_service.dart';



class MockWebService implements WebService{

  @override
  Future<List<Product>> getProducts() async{
    //await Future.delayed(const Duration(seconds: 2));
    return _mockProducts;
  }
}

final _mockProducts = [
  Product(id: 1, name: "Пуловер", description: "Кофта кофта кофта", price: 3400,),
  Product(id: 2, name: "Футболка", description: "Классическая футболка", price: 1200,),
  Product(id: 3, name: "Джинсы", description: "Стандартный размер", price: 4500,),
  Product(id: 4, name: "Куртка", description: "Универсальный вариант", price: 6500,),
  Product(id: 5, name: "Шапка", description: "На голову", price: 1200,),
  Product(id: 6, name: "Настольная игра", description: "Для всей семьи", price: 1500,),
  Product(id: 7, name: "Кружка для кофе", description: "С логотипом компании", price: 800,),
  Product(id: 8, name: "Наушники", description: "Беспроводные", price: 2500,),
  Product(id: 9, name: "Телевизор", description: "LED 55\"", price: 70000,),
  Product(id: 10, name: "Ноутбук", description: "15.6\" Full HD", price: 60000,),
  Product(id: 11, name: "Смартфон", description: "6GB RAM, 128GB ROM", price: 35000,),
  Product(id: 12, name: "Кухонный комбайн", description: "Мощность 1000W", price: 3000,),
  Product(id: 13, name: "Часы умные", description: "Соединение Bluetooth", price: 2000,),
  Product(id: 14, name: "Подставка", description: "С USB-порту", price: 500,),
  Product(id: 15, name: "Рюкзак", description: "На колесиках", price: 4000,),
];

