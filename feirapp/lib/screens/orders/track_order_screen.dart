// ignore_for_file: must_be_immutable, curly_braces_in_flow_control_structures

import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/enum/forma_pagamento_enum.dart';
import 'package:feirapp/models/enum/status_pedido_enum.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/models/my_order_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class TrackOrderScreen extends StatefulWidget {
  int idOrder;
  TrackOrderScreen({
    Key? key,
    required this.idOrder,
  }) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  var orderController = Get.find<MyOrderController>();

  MyOrderModel? order;

  _setOrder() {
    order = orderController.myOrders!
        .firstWhere((element) => element.id == widget.idOrder);
  }

  @override
  void initState() {
    super.initState();

    _setOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do pedido',
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RectangleCardWidget(productModeldto: product),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Icon(
            //       UniconsLine.box,
            //       size: Dimensions.icon40,
            //       color: AppColors.primaryColor,
            //     ),
            //     Transform(
            //       alignment: Alignment.center,
            //       transform: Matrix4.rotationY(math.pi),
            //       child: Icon(
            //         UniconsLine.truck,
            //         size: Dimensions.icon40,
            //         color: AppColors.primaryColor,
            //       ),
            //     ),
            //     Icon(
            //       UniconsLine.truck_loading,
            //       size: Dimensions.icon40,
            //       color: AppColors.greyColor,
            //     ),
            //     Icon(
            //       UniconsLine.dropbox,
            //       size: Dimensions.icon40,
            //       color: AppColors.greyColor,
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.width20, left: Dimensions.width20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pedido: ' + order!.id.toString()),
                  Text('Status do pedido: ' + _getStatusOrder(order!.status)),
                  Text('Forma de pagamento: ' +
                      _getFormaPagamento(order!.formaPagamento)),
                  Text('Data de início: ' +
                      DateFormat('dd/MM/yyyy HH:mm')
                          .format(order!.dataPedidoInicio!)
                          .toString()),
                  Text('Data atualizado: ' +
                      DateFormat('dd/MM/yyyy HH:mm')
                          .format(order!.dataPedidoAtualizado!)
                          .toString()),
                  Text('Quantidade de items: ' +
                      order!.itemPedidos.length.toString()),
                  Text('Valor total: R\$' +
                      order!.valorTotal.toStringAsFixed(2)),
                  Text('Observação: ' + order!.observacao),
                  Text('Endereço de entrega: ' + order!.enderecoEntrega),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dividerLine,
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: Text(
                    'Produtos do pedido:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font16),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: order!.itemPedidos.length,
                    itemBuilder: (context, index) {
                      return _detailsStatus(order!.itemPedidos[index]);
                    }),
                //_detailsStatus(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  var headerApp = Container(
    margin: EdgeInsets.only(
      top: Dimensions.height45,
      bottom: Dimensions.height20,
    ),
    padding: EdgeInsets.only(
      left: Dimensions.width20,
      right: Dimensions.width20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
                backgroundImage: AssetImage('images/forgot_password.jpg')),
            SizedBox(width: Dimensions.width20),
            Column(
              children: [
                Text(
                  "Meus Pedidos",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: Dimensions.font18),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
      ],
    ),
  );

  var dividerLine = Container(
    margin: EdgeInsets.only(top: Dimensions.height10),
    child: Divider(
      color: AppColors.greyColor,
      thickness: 2,
      indent: Dimensions.width20,
      endIndent: Dimensions.width20,
    ),
  );

  _detailsStatus(ItemCartModel itemCart) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryColor,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemCart.produto.nome,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Descrição: ' + itemCart.produto.descricao,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Categoria: ' + itemCart.produto.categoria,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      itemCart.produto.oferta ? 'Produto em oferta' : '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Valor: R\$' + itemCart.valorItem.toStringAsFixed(2)),
              Text('Qtd: ' + itemCart.quantidadePeso.toString())
            ],
          ),
        ],
      ),
    );
  }

  String _getStatusOrder(StatusPedido? status) {
    if (status == StatusPedido.aberto)
      return 'Aberto';
    else if (status == StatusPedido.confirmado)
      return 'Confirmado';
    else
      return 'Concluido';
  }

  String _getFormaPagamento(FormaPagamento formaPagamento) {
    if (formaPagamento == FormaPagamento.cartao)
      return 'Cartão';
    else if (formaPagamento == FormaPagamento.dinheiro)
      return 'Dinheiro';
    else
      return 'Pix';
  }
}
