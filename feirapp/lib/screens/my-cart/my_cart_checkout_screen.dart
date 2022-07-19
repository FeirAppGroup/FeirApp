// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/header_icon_title_widget.dart';
import 'package:get/get.dart';

class MyCartCheckoutScreen extends StatefulWidget {
  const MyCartCheckoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCartCheckoutScreen> createState() => _MyCartCheckoutScreenState();
}

class _MyCartCheckoutScreenState extends State<MyCartCheckoutScreen> {
  List<ProductModeldto> myCart = [
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 2,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 2,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 2,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            space60,
            HeaderIconTitleWidget(
              text: 'Checkout',
              route: Routes.tabScreen,
            ),
            shippingAddress(myCart),
          ],
        ),
      ),
    );
  }
}

var space60 = SizedBox(
  height: 60,
);

shippingAddress(myCart) => SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleSection('Endereço de Entrega'),
            rowAddress(),
            titleSection('Lista do Pedido'),
            listOrder(myCart),
            buttonToPayment(),
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
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 62,
        width: double.infinity,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
listOrder(List<ProductModeldto> myCart) => ListView.builder(
      shrinkWrap: true,
      itemCount: myCart.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            isThreeLine: true,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 24,
              ),
              child: Image.asset(
                myCart[index].urlImage.toString(),
                width: 80,
                height: 80,
              ),
            ),
            title: Text(
              myCart[index].name,
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
                    'R\$ ${myCart[index].price}',
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
                    '${myCart[index].qtd}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
buttonToPayment() => ElevatedButton(
      onPressed: () {
        //TODO: Colocar rota para o pagamento
        // Get.offNamed(
        //   Routes.checkoutScreen,
        // );
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
              'Continue para o Pagamento',
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
    );