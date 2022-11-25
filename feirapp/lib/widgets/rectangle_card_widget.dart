import 'package:feirapp/models/enum/status_pedido_enum.dart';
import 'package:flutter/material.dart';

import 'package:feirapp/models/my_order_model.dart';
import 'package:intl/intl.dart';

import '../models/dtos/product_modeldto.dart';
import '../utils/app_colors.dart';
import '../utils/dimensions.dart';

class RectangleCardWidget extends StatefulWidget {
  MyOrderModel order;

  RectangleCardWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<RectangleCardWidget> createState() => _RectangleCardWidgetState();
}

class _RectangleCardWidgetState extends State<RectangleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(widget.order);
  }
}

var borderCard = const Border(
  top: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  right: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  left: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
);

//Card -> enabledButton é para reutilizar o card sem o botão de comentário/acompanhamento
_buildCard(MyOrderModel order) {
  return Container(
    margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        bottom: Dimensions.height20),
    height: Dimensions.height200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius10),
      border: borderCard,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //_imageCard(productModeldto),
        _cardDescription(order),
      ],
    ),
  );
}

_imageCard(ProductModeldto productModeldto) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: Dimensions.width100,
        height: Dimensions.height100,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          image: DecorationImage(
              image: AssetImage(productModeldto.urlImage ?? "")),
        ),
      ),
    ],
  );
}

_cardDescription(MyOrderModel order) {
  return Container(
    margin: EdgeInsets.only(top: Dimensions.height10),
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pedido: ' + order.id.toString(),
          style: TextStyle(
              fontSize: Dimensions.font20, fontWeight: FontWeight.w400),
        ),
        space5,
        Text(
          "Quantidade de produtos: " + order.itemPedidos.length.toString(),
          style: TextStyle(
              fontSize: Dimensions.font12, fontWeight: FontWeight.normal),
        ),
        space5,
        Text(
          "Data atualizado: " +
              DateFormat('dd/MM/yyyy HH:mm')
                  .format(order.dataPedidoAtualizado!)
                  .toString(),
          style: TextStyle(
              fontSize: Dimensions.font12, fontWeight: FontWeight.normal),
        ),
        space5,
        _cardSituation(_textCardSituation(order)),
        space10,
        Text(
          "R\$ " + order.valorTotal.toStringAsFixed(2),
          style: TextStyle(
              fontSize: Dimensions.font20, color: AppColors.primaryColor),
        ),
      ],
    ),
  );
}

_textCardSituation(MyOrderModel order) {
  if (order.status == StatusPedido.aberto) {
    return 'Aberto';
  } else if (order.status == StatusPedido.confirmado) {
    return 'Confirmado';
  } else {
    return 'Concluido';
  }
}

_cardSituation(String text) {
  return Container(
    width: Dimensions.width100,
    height: Dimensions.height25,
    decoration: BoxDecoration(
      color: AppColors.primaryColorLight,
      borderRadius: BorderRadius.circular(Dimensions.radius5),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: Dimensions.font10,
        ),
      ),
    ),
  );
}

var space5 = SizedBox(height: Dimensions.height5);
var space10 = SizedBox(height: Dimensions.height10);
var space20 = SizedBox(height: Dimensions.height20);
