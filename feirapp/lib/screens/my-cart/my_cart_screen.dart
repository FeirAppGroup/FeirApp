// ignore_for_file: prefer_const_constructors

import 'package:feirapp/models/dtos/product_modeldto.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/main_custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  List<ProductModeldto> myCart = [
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 1,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 1,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 1,
    ),
    ProductModeldto(
      urlImage: 'assets/images/logo.png',
      name: 'Alface',
      price: 3.50,
      qtd: 1,
    ),
  ];

  //TODO: trocar as cores do Card
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Scaffold(
      appBar: MainCustomAppBar(
          title: 'Minha Sacola', urlAvatar: 'assets/images/logo.png'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myCart.isEmpty ? cartEmpty(deviceInfo) : listMyCart(myCart),
            myCart.isEmpty ? Container() : rowCheckout(myCart),
          ],
        ),
      ),
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

listMyCart(List<ProductModeldto> myCart) => ListView.builder(
      shrinkWrap: true,
      itemCount: myCart.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return cardProductTile(myCart[index], context);
      },
    );

cardProductTile(ProductModeldto product, context) => Padding(
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
                builder: (context) => modalRemoveProduct(context),
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
            product.name,
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
                'R\$ ${product.price.toPrecision(3)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              space10,
              Row(
                children: [
                  GestureDetector(
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  space20,
                  Text(
                    '${product.qtd}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  space20,
                  GestureDetector(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          leading: Image.asset(
            product.urlImage!,
            width: 100,
            height: 100,
          ),
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );

rowCheckout(List<ProductModeldto> myCart) => Padding(
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
                'R\$ ${valorTotal(myCart)}',
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

valorTotal(List<ProductModeldto> myCart) {
  double valorTotal = 0;
  for (var item in myCart) {
    valorTotal += item.price;
  }
  return valorTotal;
}

modalRemoveProduct(context) => Center(
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
                    onPressed: () {}, //_removeProductFromCart(),
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

//TODO: Fazer a função que vai retirar o produto da sacola
_removeProductFromCart() {}

var space20 = SizedBox(
  width: 20,
);

var space10 = SizedBox(
  height: 10,
);
