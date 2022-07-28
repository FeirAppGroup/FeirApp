import 'package:get/get.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../enum/situation_enum.dart';

class ListProductDtoMock {
  ListProductDtoMock();

  List<ProductModeldto> products = [
    ProductModeldto(
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Banana Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Banana Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Banana Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Alface Delivery',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Maçã Delivery',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'teste Delivery',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.inDelivery,
    ),
    ProductModeldto(
      name: 'Alface',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      name: 'Maçã',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
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
}
