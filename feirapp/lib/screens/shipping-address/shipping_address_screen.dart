// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/dtos/shipping_address_dto.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen>
    with TickerProviderStateMixin {
  var orderController = Get.find<MyOrderController>();
  late AnimationController controllerAnimationModal;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    orderController.getMyListAddress();
    controllerAnimationModal = BottomSheet.createAnimationController(this);
    controllerAnimationModal.duration = Duration(seconds: 1);
  }

  @override
  void dispose() {
    controllerAnimationModal.dispose();

    super.dispose();
  }

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
                orderController.listShipAddress.isEmpty
                    ? emptyShippingAddress(context)
                    : buildListShippingAddress(
                        orderController.listShipAddress, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  emptyShippingAddress(context) => SizedBox(
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  transitionAnimationController: controllerAnimationModal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Dimensions.radius40),
                    ),
                  ),
                  builder: (context) => _modalAddShippingAddress(context),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                fixedSize: Size(
                  380,
                  60,
                ),
              ),
            )
          ],
        ),
      );

  buildListShippingAddress(
          List<ShippingAddressDto> shippings, BuildContext context) =>
      Column(
        children: [
          listShippingAddress(shippings),
          buildColumnButtons(context),
        ],
      );

  listShippingAddress(List<ShippingAddressDto> shippings) => ListView.builder(
        itemCount: shippings.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return cardShippingAddress(shippings[index], context);
        },
      );

  cardShippingAddress(ShippingAddressDto shipping, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Card(
          elevation: 8,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            onTap: () {
              setState(() {
                shipping.isSelect = !shipping.isSelect;
              });
            },
            isThreeLine: false,
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                shipping.isSelect
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            title: Text(
              shipping.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              shipping.street +
                  ', ' +
                  shipping.number +
                  '  ' +
                  shipping.district,
            ),
            leading: Container(
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
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      );

  buildColumnButtons(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                'Adicionar Novo Endereço',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  transitionAnimationController: controllerAnimationModal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Dimensions.radius40),
                    ),
                  ),
                  builder: (context) => _modalAddShippingAddress(context),
                );
              },
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
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.checkoutScreen);
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
                  'Salvar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _modalAddShippingAddress(context) {
    late String _name = '';
    late String _street = '';
    late String _number = '';
    late String _district = '';
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height60,
                  bottom: Dimensions.height30,
                ),
                child: Text(
                  'Adicionar Endereço',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Rua',
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'A rua é obrigatória';
                          } else {
                            _street = value;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Número',
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O número é obrigatório';
                          } else {
                            _number = value;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Bairro',
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O bairro é obrigatório';
                          } else {
                            _district = value;
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
                            controllerAnimationModal.reverse();
                            orderController.addShipAddress(
                              ShippingAddressDto(
                                name: _name,
                                street: _street,
                                number: _number,
                                district: _district,
                                isSelect: false,
                              ),
                            );
                          }
                          Navigator.pop(context);
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
                            'Salvar',
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
        ),
      ),
    );
  }
}
