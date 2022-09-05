import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        route: Routes.getPaymentMethodsScreen(),
        title: 'Adicionar Novo Cartão',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
