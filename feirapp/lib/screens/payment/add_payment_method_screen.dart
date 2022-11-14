// ignore_for_file: prefer_const_constructors

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    late String _nameCard;
    late String _numberCard;
    late String _dateExpire;
    late String _cvv;

    return Scaffold(
      appBar: CustomAppBar(
        route: Routes.getPaymentMethodsScreen(),
        title: 'Adicionar Novo Cartão',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 370,
                height: Dimensions.height250,
                decoration: BoxDecoration(
                  color: AppColors.primaryColorLight,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('MyCard', style: _textWhite),
                        Text('Informações', style: _textWhite),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('**** **** **** ****', style: _numberCardStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('Nome do Cartão', style: _textWhite),
                            Text('**** ****', style: _textWhite),
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('Data de validade', style: _textWhite),
                            Text('**/****', style: _textWhite),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.backgroundIconColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //TODO: Adicionar BorderRadius
                          TextFormField(
                            cursorColor: AppColors.textStyle,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              labelText: 'Nome do cartão',
                              labelStyle: TextStyle(
                                color: AppColors.textStyle,
                                fontSize: 16,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'O nome é obrigatório';
                              } else {
                                _nameCard = value;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            cursorColor: AppColors.textStyle,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              labelText: 'Número do cartão',
                              labelStyle: TextStyle(
                                color: AppColors.textStyle,
                                fontSize: 16,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Número do cartão é obrigatório';
                              } else {
                                _numberCard = value;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            //TODO: fazer campo do tipo data
                            cursorColor: AppColors.textStyle,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              labelText: 'Data de Validade',
                              labelStyle: TextStyle(
                                color: AppColors.textStyle,
                                fontSize: 16,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'A data de validade é obrigatório';
                              } else {
                                _dateExpire = value;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            cursorColor: AppColors.textStyle,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              labelText: 'CVV',
                              labelStyle: TextStyle(
                                color: AppColors.textStyle,
                                fontSize: 16,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'O CVV é obrigatório';
                              } else {
                                _cvv = value;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
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
                              child: Text(
                                'Adicionar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _textWhite = TextStyle(
  color: AppColors.backgroundIconColor,
  fontSize: Dimensions.font16,
);
final _numberCardStyle = TextStyle(
  color: AppColors.backgroundIconColor,
  fontSize: 30,
  wordSpacing: 40,
  fontWeight: FontWeight.bold,
);
