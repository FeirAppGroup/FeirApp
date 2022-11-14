// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  var orderController = Get.find<MyOrderController>();
  var loginController = Get.find<LoginController>();

  Future<void> carregaMyCart() async {
    if (loginController.user != null) {
      await orderController.getMyCart(loginController.user!.token);
    } else {
      loginController.logout();
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _removeProductFromCart(ItemCartModel itemCart) async {
    setState(() {
      isLoading = true;
    });
    var resp = await orderController.removeItemMyCart(itemCart);
    setState(() {
      isLoading = false;
    });
    if (resp == 'Item removido com sucesso.') {
      showModal(context, resp,
          true); //esse bool serve para selecionar a rota e a mensagem do modal
    } else {
      showModal(context, resp, false);
    }
  }

  @override
  initState() {
    carregaMyCart();
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sacola'),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: SpinKitCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                    );
                  },
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  orderController.myCart == null ||
                          orderController.myCart!.isEmpty
                      ? cartEmpty(deviceInfo)
                      : listMyCart(
                          orderController.myCart!,
                        ),
                  orderController.myCart == null ||
                          orderController.myCart!.isEmpty
                      ? Container()
                      : rowCheckout(
                          orderController.myCart!,
                        ),
                ],
              ),
            ),
    );
  }

  modalRemoveProduct(context, ItemCartModel itemCart) => Center(
        child: SizedBox(
          width: double.infinity,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Retirar da Sacola?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 42,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: AppColors.backgroundIconColor,
                        fixedSize: Size(
                          150,
                          60,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _removeProductFromCart(itemCart);
                        Navigator.pop(context);
                      }, //
                      child: Text(
                        'Sim, Retirar',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: AppColors.primaryColor,
                        fixedSize: Size(
                          150,
                          60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  listMyCart(List<ItemCartModel> itens) => ListView.builder(
        shrinkWrap: true,
        itemCount: itens.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return cardProductTile(itens[index], context);
        },
      );

  cardProductTile(ItemCartModel itemCart, context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 8,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            isThreeLine: true,
            trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => modalRemoveProduct(context, itemCart),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.delete_outline_rounded,
              ),
            ),
            title: Text(
              itemCart.produto.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'R\$ ${itemCart.valorItem.toPrecision(3)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                space10,
                Row(
                  children: [
                    space20,
                    Text(
                      '${itemCart.quantidadePeso}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    space20,
                  ],
                ),
              ],
            ),
            leading: Image.asset(
              itemCart.produto.urlFoto,
              width: 100,
              height: 100,
            ),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      );

  rowCheckout(List<ItemCartModel> itensCart) => Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Valor Total',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'R\$ ${valorTotal(itensCart)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.checkoutScreen,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                primary: AppColors.primaryColor,
                fixedSize: Size(
                  240,
                  60,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  valorTotal(List<ItemCartModel> itensCart) {
    double valorTotal = 0;
    for (var item in itensCart) {
      valorTotal += item.produto.valor;
    }
    return valorTotal.toPrecision(2);
  }

  showModal(BuildContext context, String text, bool success) {
    // configura o button
    Widget okButton = TextButton(
      child: Text(
        "OK",
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

    Widget retryButton = TextButton(
      child: Text(
        "Cancelar",
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

    AlertDialog alerta = AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "Sacola",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.all(24),
      actionsPadding: EdgeInsets.only(bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        success ? okButton : retryButton,
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
}

var space60 = SizedBox(
  height: 60,
);
var headerApp = SizedBox(
  width: double.infinity,
  child: Padding(
    padding: const EdgeInsets.fromLTRB(
      20,
      0,
      20,
      0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Minha Sacola',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.search_rounded,
          ),
        ),
      ],
    ),
  ),
);
cartEmpty(deviceInfo) => SizedBox(
      height: deviceInfo.size.height - 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'assets/images/cart-empty.png',
              width: 200,
              height: 200,
            ),
            Text(
              'Sacola Vazia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Você não tem itens adicionados na sacola no momento!',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

var space20 = SizedBox(
  width: 20,
);

var space10 = SizedBox(
  height: 10,
);
