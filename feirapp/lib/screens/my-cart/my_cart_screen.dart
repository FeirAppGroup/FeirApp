// ignore_for_file: prefer_const_constructors

import 'package:feirapp/models/dtos/product_modeldto.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space60,
            headerApp,
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
      itemBuilder: (BuildContext context, index) {
        return cardProduct(myCart[index]);
      },
    );

cardProduct(ProductModeldto product) => Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        0,
      ),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.urlImage!,
              width: 100,
              height: 100,
            ),
            space20,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                space10,
                Text(
                  'R\$ ${product.price}',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                space10,
                Row(
                  children: [
                    GestureDetector(
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    space20,
                    Text(
                      '${product.qtd}',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    space20,
                    GestureDetector(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    space20,
                    space20,
                    space20,
                    space20,
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline_rounded,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );

rowCheckout(List<ProductModeldto> myCart) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Valor Total'),
            Text(
              'R\$ ${valorTotal(myCart)}',
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
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
    );

valorTotal(List<ProductModeldto> myCart) {
  double valorTotal = 0;
  for (var item in myCart) {
    valorTotal += item.price;
  }
  return valorTotal;
}

var space20 = SizedBox(
  width: 20,
);

var space10 = SizedBox(
  height: 10,
);
