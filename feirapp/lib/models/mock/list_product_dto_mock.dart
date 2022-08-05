import 'package:get/get.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../enum/situation_enum.dart';

class ListProductDtoMock {
  ListProductDtoMock();

  List<ProductModeldto> products = [
    ProductModeldto(
      id: 0,
      name: 'Alface Completed',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      id: 1,
      name: 'Alface Delivery 1',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 2,
      name: 'Maçã Delivery 2',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 3,
      name: 'Banana Delivery 3',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 4,
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 5,
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 6,
      name: 'Banana Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 7,
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 8,
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 9,
      name: 'Banana Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 10,
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 11,
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 12,
      name: 'teste Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      id: 13,
      name: 'Alface',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      id: 14,
      name: 'Maçã',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      id: 15,
      name: 'Banana',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
  ];

  getProduct(int index) {
    ProductModeldto product = products[index];
    return product;
  }

  getAllProducts() {
    return products;
  }
}
