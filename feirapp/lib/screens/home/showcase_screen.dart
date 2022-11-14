// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/property_controller.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:feirapp/models/property_model.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen>
    with TickerProviderStateMixin {
  late AnimationController controllerAnimationModal;

  @override
  void initState() {
    super.initState();

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Vitrine de Propriedades'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<PropertyController>(
              builder: (_) {
                return _.propertys.isEmpty
                    ? SpinKitCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _.propertys.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          return buildListTile(_.propertys[position]);
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  buildListTile(
    PropertyModel property,
  ) =>
      Card(
        elevation: 8,
        shadowColor: AppColors.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius10),
                    topRight: Radius.circular(Dimensions.radius10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(property.urlFoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(property.nome),
              Text('Endereço: ${property.endereco}'),
              Text('Trabalhadores: ${property.quantidadeTrabalhador}'),
              Text('Tamanho: ${property.tamanho}'),
              ElevatedButton(
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
                    builder: (context) =>
                        _modalListProducts(context, property.produtos),
                  );
                },
                child: Text('Conheça nossos produtos'),
              ),
            ],
          ),
        ),
      );
}

_modalListProducts(BuildContext context, List<ProductModel> products) {
  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Center(
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: products.length,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, position) {
            return buildListProducts(products[position]);
          },
        ),
      ),
    ),
  );
}

buildListProducts(ProductModel product) {
  return Card(
    elevation: 8,
    shadowColor: AppColors.shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.height120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                Dimensions.radius10,
              )),
              image: DecorationImage(
                image: AssetImage(product.urlFoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(product.nome),
          Text('Valor: ${product.valor}'),
          Text('Categoria: ${product.categoria}'),
          Text('Descrição: ${product.descricao}'),
          ElevatedButton(
            onPressed: () {
              //TODO: colocar função para adicionar na sacola
            },
            child: Text('Adicionar na sacola'),
          ),
        ],
      ),
    ),
  );
}
