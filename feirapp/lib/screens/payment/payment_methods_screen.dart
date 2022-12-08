// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/dtos/item_cart_dto.dart';
import 'package:feirapp/models/dtos/my_order_dto.dart';
import 'package:feirapp/models/dtos/payment_methods_dto.dart';
import 'package:feirapp/models/enum/forma_pagamento_enum.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  var orderController = Get.find<MyOrderController>();
  var loginController = Get.find<LoginController>();

  bool isLoading = false;
  Future<void> _finalizarPedido() async {
    setState(() {
      isLoading = true;
    });
    String body = '';
    List<ItemCartDTO> items = _ajustaItems(orderController.myCart!);
    //monta o pedido
    MyOrderDTO order = MyOrderDTO(
      idUsuario: loginController.user!.id,
      itemPedidos: items,
      formaPagamento: _getFormaPagamento(),
      observacao: _observacao,
      valorTotal: _getValorTotal(orderController.myCart!),
      enderecoEntrega: orderController.shipAddress!,
    );

    body = order.toJson();

    String resp =
        await orderController.postMyOrder(body, loginController.user!.token);

    setState(() {
      isLoading = true;
    });

    //exibe a reposta
    if (resp == 'Pedido realizado com sucesso') {
      showModalCongrats(context, resp);
    } else {
      showModalError(context, resp);
    }
  }

  List<ItemCartDTO> _ajustaItems(List<ItemCartModel> items) {
    List<ItemCartDTO> listItems = [];
    for (var item in items) {
      listItems.add(
        ItemCartDTO(
          idProduto: item.idProduto,
          valorItem: item.valorItem,
          quantidadePeso: item.quantidadePeso,
          pedidoId: item.pedidoId,
        ),
      );
    }
    return listItems;
  }

  double _getValorTotal(List<ItemCartModel> items) {
    double valorTotal = 0;
    for (var x in items) {
      valorTotal += x.valorItem;
    }
    return valorTotal;
  }

  FormaPagamento _getFormaPagamento() {
    FormaPagamento frmPgto = FormaPagamento.dinheiro;
    var type = paymentMethods.firstWhere((element) => element.isSelect).name;
    switch (type) {
      case 'Dinheiro':
        frmPgto = FormaPagamento.dinheiro;
        break;
      case 'Cartão':
        frmPgto = FormaPagamento.cartao;
        break;
      case 'PayPal':
        frmPgto = FormaPagamento.cartao;
        break;
      case 'Pix':
        frmPgto = FormaPagamento.pix;
        break;
      default:
    }
    return frmPgto;
  }

  String _observacao = '';

  //lista dos métodos de pagamento
  List<PaymentMethodsDto> paymentMethods = [
    PaymentMethodsDto(
      name: 'Dinheiro',
      urlImage: '',
      isSelect: true,
    ),
    PaymentMethodsDto(
      name: 'Cartão',
      urlImage: '',
      isSelect: false,
    ),
    PaymentMethodsDto(
      name: 'Pix',
      urlImage: '',
      isSelect: false,
    ),
    PaymentMethodsDto(
      name: 'PayPal',
      urlImage: '',
      isSelect: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Formas de Pagamento',
        route: Routes.getCheckoutScreen(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   mini: true,
      //   onPressed: () {
      //     Get.toNamed(Routes.getAddPaymentMethodScreen());
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: AppColors.blackColor,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textPayment(),
              buildListPaymentMethods(),
              Padding(
                padding: EdgeInsets.all(Dimensions.height15),
                child: TextFormField(
                  maxLength: 250,
                  minLines: 1,
                  maxLines: 5,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: Dimensions.font20),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'Comentário',
                    labelStyle: TextStyle(
                      fontSize: Dimensions.font16,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                  ),
                  onChanged: (value) => _observacao = value,
                ),
              ),
              SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: buttonToPayment(),
      resizeToAvoidBottomInset: false,
    );
  }

  textPayment() => Text(
        'Selecione qual será a forma de pagamento',
        style: TextStyle(
          fontSize: 16,
        ),
      );

  buildListPaymentMethods() => ListView.builder(
        itemCount: paymentMethods.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return cardPaymentsMethods(paymentMethods[index], context);
        },
      );

  cardPaymentsMethods(PaymentMethodsDto paymentMethod, context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 8,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            onTap: () {
              for (var item in paymentMethods) {
                if (paymentMethods.indexOf(item) ==
                    paymentMethods.indexOf(paymentMethod)) {
                  item.isSelect = true;
                } else {
                  item.isSelect = false;
                }
              }
              setState(() {
                paymentMethods;
              });
            },
            isThreeLine: false,
            trailing: IconButton(
              onPressed: () {
                for (var item in paymentMethods) {
                  if (paymentMethods.indexOf(item) ==
                      paymentMethods.indexOf(paymentMethod)) {
                    item.isSelect = true;
                  } else {
                    item.isSelect = false;
                  }
                }
                setState(() {
                  paymentMethods;
                });
              },
              icon: Icon(
                paymentMethod.isSelect
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            title: Text(
              paymentMethod.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.primaryColor,
              ),
              child: Icon(
                Icons
                    .payment_rounded, //TODO:adicionar imagens para os diferentes tipos de pagamento
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      );

  buttonToPayment() => SizedBox(
        height: 80,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 8),
            child: ElevatedButton(
              onPressed: () {
                //método que vai finalizar o pedido
                _finalizarPedido();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                primary: AppColors.primaryColor,
                fixedSize: Size(
                  380,
                  60,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Finalizar pedido',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

showModalCongrats(BuildContext context, String resp) {
  // configura o button
  Widget okButton = TextButton(
    child: Text(
      "Ver Pedido",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      // Get.offNamed(Routes.ordersScreen);
      //TODO: enviar para a nova tela de detalhes do pedido
      Get.offNamed(Routes.tabScreen);
    },
  );
  Widget goToHome = TextButton(
    child: Text(
      "Votar para Feira",
      style: TextStyle(
        color: AppColors.primaryColorLight,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Get.offNamed(Routes.tabScreen);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 190,
          height: 250,
          child: Image.asset(
            'assets/images/congratulations.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Pedido Finalizado!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    content: Text(
      resp.toString(),
      textAlign: TextAlign.center,
    ),
    contentPadding: EdgeInsets.all(24),
    actionsPadding: EdgeInsets.only(bottom: 16),
    actionsOverflowAlignment: OverflowBarAlignment.center,
    actions: [
      //okButton,
      goToHome,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showModalError(BuildContext context, String resp) {
  // configura o button
  Widget okButton = TextButton(
    child: Text(
      "Tentar novamente",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 190,
          height: 250,
          child: Image.asset(
            'assets/images/error.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Erro ao finalizar pedido",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    content: Text(
      resp.toString(),
      textAlign: TextAlign.center,
    ),
    contentPadding: EdgeInsets.all(24),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
