import 'dart:convert';

class StockModel {
  int id;
  int idProduto;
  double quantidade;
  DateTime dataAtualizado;
  StockModel({
    required this.id,
    required this.idProduto,
    required this.quantidade,
    required this.dataAtualizado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idProduto': idProduto,
      'quantidade': quantidade,
      'dataAtualizado': dataAtualizado.millisecondsSinceEpoch,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id']?.toInt() ?? 0,
      idProduto: map['idProduto']?.toInt() ?? 0,
      quantidade: map['quantidade']?.toDouble() ?? 0.0,
      dataAtualizado:
          DateTime.fromMillisecondsSinceEpoch(map['dataAtualizado']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StockModel.fromJson(String source) =>
      StockModel.fromMap(json.decode(source));
}
