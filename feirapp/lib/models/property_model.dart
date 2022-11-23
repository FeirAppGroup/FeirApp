import 'dart:convert';

import 'package:feirapp/models/product_model.dart';

class PropertyModel {
  int id;
  int idUsuario;
  String nome;
  String matricula;
  String endereco;
  String localizacao;
  double tamanho;
  int quantidadeTrabalhador;
  String urlFoto;
  List<ProductModel> produtos;

  PropertyModel({
    required this.id,
    required this.idUsuario,
    required this.nome,
    required this.matricula,
    required this.endereco,
    required this.localizacao,
    required this.tamanho,
    required this.quantidadeTrabalhador,
    required this.urlFoto,
    required this.produtos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'nome': nome,
      'matricula': matricula,
      'endereco': endereco,
      'localizacao': localizacao,
      'tamanho': tamanho,
      'quantidadeTrabalhador': quantidadeTrabalhador,
      'urlFoto': urlFoto,
      'produtos': produtos.map((x) => x.toMap()).toList(),
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id']?.toInt() ?? 0,
      idUsuario: map['idUsuario']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      matricula: map['matricula'] ?? '',
      endereco: map['endereco'] ?? '',
      localizacao: map['localizacao'] ?? '',
      tamanho: map['tamanho']?.toDouble() ?? 0.0,
      quantidadeTrabalhador: map['quantidadeTrabalhador']?.toInt() ?? 0,
      urlFoto: map['urlFoto'] ?? '',
      produtos: List<ProductModel>.from(
        map['produtos']?.map(
          (x) => ProductModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyModel.fromJson(String source) =>
      PropertyModel.fromMap(json.decode(source));
}
