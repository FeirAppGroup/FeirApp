import 'dart:convert';

class ProductModel {
  int id;
  int idPropriedade;
  String nome;
  String categoria;
  String descricao;
  bool organico;
  String urlFoto;
  double valor;
  bool oferta;

  ProductModel({
    required this.id,
    required this.idPropriedade,
    required this.nome,
    required this.categoria,
    required this.descricao,
    required this.organico,
    required this.urlFoto,
    required this.valor,
    required this.oferta,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idPropriedade': idPropriedade,
      'nome': nome,
      'categoria': categoria,
      'descricao': descricao,
      'organico': organico,
      'urlFoto': urlFoto,
      'valor': valor,
      'oferta': oferta,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      idPropriedade: map['idPropriedade']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      categoria: map['categoria'] ?? '',
      descricao: map['descricao'] ?? '',
      organico: map['organico'] ?? false,
      urlFoto: map['urlFoto'] ?? '',
      valor: map['valor']?.toDouble() ?? 0.0,
      oferta: map['oferta'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
