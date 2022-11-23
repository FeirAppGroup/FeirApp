import 'dart:convert';

import 'package:feirapp/models/dtos/item_cart_dto.dart';
import 'package:feirapp/models/enum/forma_pagamento_enum.dart';

class MyOrderDTO {
  int idUsuario;
  String observacao;
  double valorTotal;
  FormaPagamento formaPagamento;
  String enderecoEntrega;
  List<ItemCartDTO> itemPedidos;
  MyOrderDTO({
    required this.idUsuario,
    required this.observacao,
    required this.valorTotal,
    required this.formaPagamento,
    required this.enderecoEntrega,
    required this.itemPedidos,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'observacao': observacao,
      'valorTotal': valorTotal,
      'formaPagamento': formaPagamento.index,
      'enderecoEntrega': enderecoEntrega,
      'itemPedidos': itemPedidos.map((x) => x.toMap()).toList(),
    };
  }

  factory MyOrderDTO.fromMap(Map<String, dynamic> map) {
    int valFormaPgto = map['formaPagamento'];
    return MyOrderDTO(
      idUsuario: map['idUsuario']?.toInt() ?? 0,
      observacao: map['observacao'] ?? '',
      valorTotal: map['valorTotal']?.toDouble() ?? 0.0,
      formaPagamento: FormaPagamento.values[valFormaPgto],
      enderecoEntrega: map['enderecoEntrega'],
      itemPedidos: List<ItemCartDTO>.from(
          map['itemPedidos']?.map((x) => ItemCartDTO.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyOrderDTO.fromJson(String source) =>
      MyOrderDTO.fromMap(json.decode(source));
}
