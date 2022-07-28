import 'package:feirapp/models/enum/situation_enum.dart';

class ProductModeldto {
  int? id;
  String? urlImage;
  String name;
  String? description;
  double price;
  double qtd;
  Situation? situation;
  ProductModeldto({
    this.id,
    this.urlImage,
    required this.name,
    this.description,
    required this.price,
    required this.qtd,
    this.situation,
  });
}
