import 'dart:convert';

class ItemCartDTO {
  int idProduto;
  double valorItem;
  double quantidadePeso;
  int pedidoId;
  ItemCartDTO({
    required this.idProduto,
    required this.valorItem,
    required this.quantidadePeso,
    required this.pedidoId,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProduto': idProduto,
      'valorItem': valorItem,
      'quantidadePeso': quantidadePeso,
      'pedidoId': pedidoId,
    };
  }

  factory ItemCartDTO.fromMap(Map<String, dynamic> map) {
    return ItemCartDTO(
      idProduto: map['idProduto']?.toInt() ?? 0,
      valorItem: map['valorItem']?.toDouble() ?? 0.0,
      quantidadePeso: map['quantidadePeso']?.toDouble() ?? 0.0,
      pedidoId: map['pedidoId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCartDTO.fromJson(String source) =>
      ItemCartDTO.fromMap(json.decode(source));
}
