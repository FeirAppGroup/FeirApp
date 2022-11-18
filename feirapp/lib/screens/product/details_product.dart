// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/my_order_controller.dart';
import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/models/item_cart_model.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:feirapp/models/stock_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DetailsProductScreen extends StatefulWidget {
  int idProduct;
  DetailsProductScreen({
    required this.idProduct,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  ProductModel? product;
  StockModel? stock;
  var productController = Get.find<ProductController>();
  var mycartController = Get.find<MyOrderController>();
  var loginController = Get.find<LoginController>();

  Future<void> carregaProduct() async {
    product = await productController.getProductDetails(
      widget.idProduct,
    );
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _getStockProduct() async {
    setState(() {
      isLoading = true;
    });

    stock = await productController.getStockByIdProduct(widget.idProduct);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _addProductToCart(ProductModel? product) async {
    setState(() {
      isLoading = false;
    });
    var itemCart = ItemCartModel(
        idProduto: product!.id,
        valorItem: (product.valor * _quantity).toPrecision(2),
        quantidadePeso: _quantity,
        pedidoId: 0,
        produto: product);

    var resp = await mycartController.saveMyCart(itemCart);

    setState(() {
      isLoading = false;
    });

    if (resp == 'Produto adicionado na sacola') {
      showModal(
        context,
        resp,
        true,
      ); //esse bool serve para selecionar a rota e a mensagem do modal
    } else {
      showModal(
        context,
        resp,
        false,
      );
    }
  }

  @override
  void initState() {
    carregaProduct();
    _getStockProduct();
    super.initState();
  }

  bool _favorite = false;
  double _quantity = 1;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isLoading
          ? SpinKitCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                );
              },
            )
          : Container(
              height: 70,
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        const Text(
                          'Preço Total',
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: AppColors.greyColor),
                        ),
                        Text(
                          'R\$ ${(product!.valor * _quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      primary: AppColors.primaryColor,
                    ),
                    onPressed: () => {_addProductToCart(product)},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Adicionar ao Carrinho',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Urbanist',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      body: isLoading
          ? Center(
              child: SizedBox(
              height: 200,
              width: 200,
              child: SpinKitCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                  );
                },
              ),
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BackButton(),
                      alignment: Alignment.topLeft,
                    ),
                    Center(
                      child: Image.asset(
                        product!.urlFoto,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product!.nome,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                        IconButton(
                            onPressed: () => setState(() {
                                  _favorite = !_favorite;
                                }),
                            icon: !_favorite
                                ? Icon(
                                    Icons.favorite_border,
                                    color: AppColors.primaryColor,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: AppColors.primaryColor,
                                  ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.blackColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Descrição',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      product!.descricao,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Quantidade',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () => {
                                  if (_quantity == 1)
                                    _quantity = 1
                                  else
                                    setState(() {
                                      _quantity--;
                                    })
                                },
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.primaryColor,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$_quantity',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () => setState(() {
                                  _quantity++;
                                }),
                            icon: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

showModal(BuildContext context, String text, bool success) {
  // configura o button
  Widget okButton = TextButton(
    child: Text(
      "Continuar comprando",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Get.toNamed(Routes.getTabScreen());
    },
  );

  Widget retryButton = TextButton(
    child: Text(
      "Tentar novamente",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alerta = AlertDialog(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(
          height: 24,
        ),
        Text(
          "Sacola",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    contentPadding: EdgeInsets.all(24),
    actionsPadding: EdgeInsets.only(bottom: 16),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      success ? okButton : retryButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
