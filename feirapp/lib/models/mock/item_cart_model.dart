import 'dart:convert';

class ItemCartModel {
  int id;
  int idProduto;
  double valorItem;
  double quantidadePeso;
  int pedidoId;
  ItemCartModel({
    required this.id,
    required this.idProduto,
    required this.valorItem,
    required this.quantidadePeso,
    required this.pedidoId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idProduto': idProduto,
      'valorItem': valorItem,
      'quantidadePeso': quantidadePeso,
      'pedidoId': pedidoId,
    };
  }

  factory ItemCartModel.fromMap(Map<String, dynamic> map) {
    return ItemCartModel(
      id: map['id']?.toInt() ?? 0,
      idProduto: map['idProduto']?.toInt() ?? 0,
      valorItem: map['valorItem']?.toDouble() ?? 0.0,
      quantidadePeso: map['quantidadePeso']?.toDouble() ?? 0.0,
      pedidoId: map['pedidoId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCartModel.fromJson(String source) =>
      ItemCartModel.fromMap(json.decode(source));
}
