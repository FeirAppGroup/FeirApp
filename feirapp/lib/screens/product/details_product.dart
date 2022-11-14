// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/models/product_model.dart';
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

  Future<void> carregaProduct() async {
    product = await Get.find<ProductController>().getProductDetails(
      widget.idProduct,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    carregaProduct();
    super.initState();
  }

  bool _favorite = false;
  int _quantity = 1;
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
                    onPressed: () => {
                      //TODO: realizar o post para enviar ao carrinho
                    },
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
