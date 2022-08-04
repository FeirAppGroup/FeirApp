class ShippingAddressDto {
  String name;
  String street;
  String number;
  String district;
  bool isSelect;
  ShippingAddressDto({
    required this.name,
    required this.street,
    required this.number,
    required this.district,
    required this.isSelect,
  });
}
