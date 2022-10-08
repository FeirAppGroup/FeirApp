//pedido
import 'dart:convert';

import 'package:feirapp/models/enum/forma_pagamento_enum.dart';
import 'package:feirapp/models/enum/status_pedido_enum.dart';
import 'package:feirapp/models/mock/item_cart_model.dart';

class MyCartModel {
  int id;
  int idUsuario;
  String observacao;
  double valorTotal;
  DateTime dataPedidoInicio;
  DateTime dataPedidoAtualizado;
  StatusPedido status; //aqui será um enum
  FormaPagamento formaPagamento;
  List<ItemCartModel> itemPedidos;
  MyCartModel({
    required this.id,
    required this.idUsuario,
    required this.observacao,
    required this.valorTotal,
    required this.dataPedidoInicio,
    required this.dataPedidoAtualizado,
    required this.status,
    required this.formaPagamento,
    required this.itemPedidos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'observacao': observacao,
      'valorTotal': valorTotal,
      'dataPedidoInicio': dataPedidoInicio.millisecondsSinceEpoch,
      'dataPedidoAtualizado': dataPedidoAtualizado.millisecondsSinceEpoch,
      'status': status.index,
      'formaPagamento': formaPagamento.index,
      'itemPedidos': itemPedidos.map((x) => x.toMap()).toList(),
    };
  }

  factory MyCartModel.fromMap(Map<String, dynamic> map) {
    int valStatus = map['status'];
    int valFormaPgto = map['formaPagamento'];
    return MyCartModel(
      id: map['id']?.toInt() ?? 0,
      idUsuario: map['idUsuario']?.toInt() ?? 0,
      observacao: map['observacao'] ?? '',
      valorTotal: map['valorTotal']?.toDouble() ?? 0.0,
      dataPedidoInicio:
          DateTime.fromMillisecondsSinceEpoch(map['dataPedidoInicio']),
      dataPedidoAtualizado:
          DateTime.fromMillisecondsSinceEpoch(map['dataPedidoAtualizado']),
      status: StatusPedido.values[valStatus],
      formaPagamento: FormaPagamento.values[valFormaPgto],
      itemPedidos: List<ItemCartModel>.from(
        map['itemPedidos']?.map(
          (x) => ItemCartModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCartModel.fromJson(String source) =>
      MyCartModel.fromMap(json.decode(source));
}
