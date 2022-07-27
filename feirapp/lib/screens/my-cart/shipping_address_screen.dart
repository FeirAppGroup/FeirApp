// ignore_for_file: prefer_const_constructors

import 'package:feirapp/models/dtos/shipping_address_dto.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  List<ShippingAddressDto> shippings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Endereço de Entrega',
        route: Routes.checkoutScreen,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shippings.isEmpty
                    ? emptyShippingAddress
                    : listShippingAddress(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var emptyShippingAddress = SizedBox(
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Nenhum endereço cadastrado!'),
        ElevatedButton(
          child: Text(
            'Adicionar Novo Endereço',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            primary: AppColors.backgroundIconColor,
            fixedSize: Size(
              380,
              60,
            ),
          ),
        )
      ],
    ));

listShippingAddress() => ListView();
