class ProductModeldto {
  String? urlImage;
  String name;
  String? description;
  double price;
  double qtd;
  ProductModeldto({
    this.urlImage,
    required this.name,
    this.description,
    required this.price,
    required this.qtd,
  });
}
