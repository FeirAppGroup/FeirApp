// ignore_for_file: prefer_const_constructors

import 'package:feirapp/models/dtos/payment_methods_dto.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  //lista dos métodos de pagamento
  List<PaymentMethodsDto> paymentMethods = [
    PaymentMethodsDto(
      name: 'Boleto',
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
        title: 'Forma de Pagamento',
        route: Routes.getCheckoutScreen(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textPayment(),
              buildListPaymentMethods(),
              buttonToPayment(),
            ],
          ),
        ),
      ),
    );
  }

  textPayment() => Text(
        'Selecione a sua forma de pagamento',
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

  cardPaymentsMethods(PaymentMethodsDto paymentMethods, context) => Padding(
        padding: const EdgeInsets.all(10),
        child: PhysicalShape(
          color: Colors.white,
          elevation: 8,
          shadowColor: AppColors.shadowColor,
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: ListTile(
            onTap: () {
              //TODO: melhorar para selecionar apenas um paymentMethods.
              setState(() {
                paymentMethods.isSelect = !paymentMethods.isSelect;
              });
            },
            isThreeLine: false,
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                paymentMethods.isSelect
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            title: Text(
              paymentMethods.name,
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

  buttonToPayment() => Padding(
        padding: const EdgeInsets.all(16),
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
        ),
      );
}
