import '../../domain/models/my_product.dart';
import 'abstract_web_service.dart';

class MockWebService implements WebService {
  @override
  Future<List<Product>> getProducts() async {
    //await Future.delayed(const Duration(seconds: 2));
    return _mockProducts;
  }
}

final _mockProducts = [
  Product(
      id: 1,
      name: "Пуловер",
      description:
          "Элегантный пуловер из высококачественного хлопка, идеально подходящий для повседневной носки. Он обладает комфортной посадкой и легким драпом, что делает его универсальным элементом гардероба. Пуловер украшен аккуратными детскими узорами, придавая ему непринужденный и милый вид.",
      price: 3400,
      url:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQz5ULujcBIzysLLHhk5yPwtfkOyBNM5b_clgG_O7FsHoG_Aa75myvobUTleeJH2Dk0fJlEJstXHhuQNmiC0FMilLLhTZXbzgG4lxAeEsI&usqp=CAE'),
  Product(
      id: 2,
      name: "Футболка",
      description:
          "Классическая футболка с печаткой, идеально подходящая для тех, кто ценит сочетание комфорта и стиля. Она изготовлена из прочного и дышащего материала, что обеспечивает отличную свободу движений и прохладу даже в жаркую погоду. Футболка имеет универсальный дизайн, который подойдет к любому образцу.",
      price: 1200,
      url:
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSu1o8N3wtUhdFqw3EfZqAEggkDlYqDv6hwUUdSIk_WQEqR2vw7Zj50lJ1oJD5DWwqpVGSNX5Aqy_8h7m5ps25Jr58v5nteLto8iWHKj2o&usqp=CAE'),
  Product(
      id: 3,
      name: "Джинсы",
      description:
          "Стильные джинсы средней посадки, идеально подходящие для ежедневной носки. Они изготовлены из качественного denim с добавлением эластичного спандекса, что обеспечивает комфорт и свободное движение. Джинсы украшены оригинальной печаткой, придавая им яркий и современный вид. Подойдут как для повседневной носки, так и для выходных.",
      price: 4500,
      url:
          'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTU6JcuGfs5PhBrJqHZbWE_AqOToWDcv72gdMuEQxQmmd3XUlvG0eXVZC6DrB782zmcNJ2fsi3w14NLdJ4ivguk7vnqPlCjO224Svki5bUJNvfai1CSCVsj&usqp=CAE'),
  Product(
      id: 4,
      name: "Куртка",
      description:
          "Универсальная куртка из водонепроницаемого материала, идеально подходящая для прохладной погоды. Она имеет теплый и мягкий меховый воротник, что делает ее идеальной для зимы или осени. Куртка украшена красивыми пуговицами и имеет два кармана, что позволяет хранить в ней мелочи. Ее универсальный дизайн делает ее идеальным дополнением к любому гардеробу.",
      price: 6500,
      url:
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSu1-qAEXfIoTsDtuKdxNr-4jxnNwA_crGkFYcn29zpa3Wx_NHyYxyLl8goir4mIydCn-_aWjHKR0C3YcLhFLsYQYLJX8Hz&usqp=CAE'),
  Product(
      id: 5,
      name: "Шапка",
      description:
          "Удобная шапка для защиты от солнца, идеально подходящая для летней погоды. Она изготовлена из легкого и воздухопроницаемого материала, что обеспечивает комфорт даже в жаркую погоду. Шапка имеет регулируемый размер, что позволяет ей подходить различным головам. Ее яркий и стильный дизайн делает ее идеальным аксессуаром для отдыха на пляже или прогулок по городу.",
      price: 1200,
      url:
          'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRS5mfoMEF0WsP2hZCHTf608iP2CMVpvIgwbtBv4or2NtDWeO3XMHWZGUf-hBsjCRmKc-rIM-qdzTyKpc7Zkpb-hbZF_U5h1Dxq7NXDmrP_BB2wxn3WLD7xTQ&usqp=CAE'),
];
