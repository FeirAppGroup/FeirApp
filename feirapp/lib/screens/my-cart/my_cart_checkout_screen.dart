// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:get/get.dart';

class MyCartCheckoutScreen extends StatefulWidget {
  const MyCartCheckoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCartCheckoutScreen> createState() => _MyCartCheckoutScreenState();
}

class _MyCartCheckoutScreenState extends State<MyCartCheckoutScreen> {
  var orderController = Get.find<MyOrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Checkout',
        route: Routes.tabScreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            shippingAddress(orderController.myCart),
          ],
        ),
      ),
      bottomSheet: buttonToPayment(),
    );
  }
}

shippingAddress(myCart) => SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleSection('Endereço de Entrega'),
            rowAddress(),
            titleSection('Lista do Pedido'),
            listOrder(myCart),
          ],
        ),
      ),
    );

titleSection(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
rowAddress() => Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Card(
        elevation: 2,
        shadowColor: AppColors.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.primaryColor,
                ),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text('Rua João Pinheiro, 1512'),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_location_alt,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  Get.toNamed(
                    Routes.shippingAddressScreen,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
listOrder(List<ItemCartModel> myCart) => ListView.builder(
      shrinkWrap: true,
      itemCount: myCart.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: 8,
            shadowColor: AppColors.shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              isThreeLine: true,
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 24,
                ),
                child: Image.asset(
                  myCart[index].produto.urlFoto,
                  width: 80,
                  height: 80,
                ),
              ),
              title: Text(
                myCart[index].produto.nome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      'R\$ ${myCart[index].valorItem.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      '${myCart[index].quantidadePeso}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
buttonToPayment() => SizedBox(
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: ElevatedButton(
            onPressed: () {
              Get.offNamed(
                Routes.getPaymentMethodsScreen(),
              );
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
                    'Escolher forma de pagamento',
                    style: TextStyle(
                      fontSize: 16,
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
        ),
      ),
    );
