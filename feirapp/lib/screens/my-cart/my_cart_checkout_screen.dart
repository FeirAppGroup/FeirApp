// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/models/dtos/shipping_address_dto.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/utils/dimensions.dart';
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

class _MyCartCheckoutScreenState extends State<MyCartCheckoutScreen>
    with TickerProviderStateMixin {
  var orderController = Get.find<MyOrderController>();

  late AnimationController controllerAnimationModal;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    orderController.getSelectedShipAddress();
    controllerAnimationModal = BottomSheet.createAnimationController(this);
    controllerAnimationModal.duration = Duration(seconds: 1);
    super.initState();
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
      bottomSheet: buttonToPayment(orderController),
    );
  }

  shippingAddress(myCart) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleSection('Lista do Pedido'),
              listOrder(myCart),
              titleSection('Endereço de Entrega'),
              orderController.shipAddressDTO != null
                  ? rowAddress(orderController.shipAddressDTO!)
                  : buttonNewAddress(),
              SizedBox(height: 60),
            ],
          ),
        ),
      );

  _modalAddShippingAddress() {
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
                                name: '',
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

  buttonNewAddress() => Padding(
        padding: EdgeInsets.all(Dimensions.height15),
        child: Center(
          child: ElevatedButton(
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
                builder: (context) => _modalAddShippingAddress(),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              primary: AppColors.primaryColor,
              fixedSize: Size(
                Dimensions.width200,
                Dimensions.height45,
              ),
            ),
            child: Center(
              child: Text(
                'Adicionar endereço',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
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
  rowAddress(ShippingAddressDto shipAddress) => Padding(
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
                    Text(
                      'Rua: ' + shipAddress.street,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Número: ' + shipAddress.number),
                    Text('Bairro: ' + shipAddress.district),
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
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      transitionAnimationController: controllerAnimationModal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Dimensions.radius40),
                        ),
                      ),
                      builder: (context) => _modalAddShippingAddress(),
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
  buttonToPayment(orderController) => SizedBox(
        height: 80,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 8),
            child: ElevatedButton(
              onPressed: () {
                orderController.shipAddressDTO == null ||
                        orderController.shipAddressDTO == ''
                    ? null
                    : Get.offNamed(
                        Routes.getPaymentMethodsScreen(),
                      );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                primary: orderController.shipAddressDTO == null ||
                        orderController.shipAddressDTO == ''
                    ? AppColors.lightColorScheme.primaryContainer
                    : AppColors.primaryColor,
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
}
