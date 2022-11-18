// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> selectFilters = [true, false, false, false];

  bool isLoading = false;
  var productController = Get.find<ProductController>();

  switchFilter(int index) {
    setState(() {
      for (var i = 0; i < selectFilters.length; i++) {
        index == i ? selectFilters[i] = true : selectFilters[i] = false;
      }
      switch (index) {
        case 0:
          verticalShowcase = verticalShowcaseAll;
          break;
        case 1: //Frutas
          productController.productCategoryFrutas.isEmpty
              ? productController.getProductByCategoryFrutas()
              : '';
          verticalShowcase = verticalShowcaseFrutas;
          break;
        case 2: //Legumes
          productController.productCategoryLegumes.isEmpty
              ? productController.getProductByCategoryLegumes()
              : '';
          verticalShowcase = verticalShowcaseLegumes;
          break;
        case 3: //Verduras
          productController.productCategoryHortalicas.isEmpty
              ? productController.getProductByCategoryHortalicas()
              : '';
          verticalShowcase = verticalShowcaseVerduras;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FeirApp'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
            ),
            tooltip: 'Buscar',
            onPressed: () {
              //TODO: copiar o search que usei no DownMaternity
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // headerApp, //OBS: Retirado para simplificar a tela
            //searchBar,
            titleArea('Ofertas Especiais', 'Ver todos'),
            horizontalShowcase,
            dividerLine,
            horizontalFilters(selectFilters),
            dividerLine,
            verticalShowcase,
          ],
        ),
      ),
    );
  }

  var verticalShowcase = verticalShowcaseAll;

  filterContent(String text, bool isSelected, int index) => GestureDetector(
        onTap: () {
          switchFilter(index);
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 2,
            bottom: 2,
          ),
          margin: EdgeInsets.fromLTRB(
            Dimensions.width5,
            Dimensions.height10,
            Dimensions.width5,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            color:
                isSelected ? AppColors.primaryColorLight : Colors.greenAccent,
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      );

  horizontalFilters(List<bool> selectFilters) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            filterContent('Todos', selectFilters[0], 0),
            filterContent('Frutas', selectFilters[1], 1),
            filterContent('Legumes', selectFilters[2], 2),
            filterContent('Verduras', selectFilters[3], 3),
          ],
        ),
      );
}

var dividerLine = Container(
  margin: EdgeInsets.only(top: Dimensions.height10),
  child: Divider(
    color: Colors.black,
    thickness: 2,
    indent: Dimensions.width20,
    endIndent: Dimensions.width20,
  ),
);

var headerApp = Container(
  margin: EdgeInsets.only(
    top: Dimensions.height45,
    bottom: Dimensions.height15,
  ),
  padding: EdgeInsets.only(
    left: Dimensions.width20,
    right: Dimensions.width20,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('images/forgot_password.jpg')),
          SizedBox(width: Dimensions.width20),
          Column(
            children: [
              Text(
                "Bom dia !",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: Dimensions.font12),
              ),
              Text("Usuário Zero"),
            ],
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.notificationScreen);
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
    ],
  ),
);

var searchBar = Container(
  padding: EdgeInsets.only(
    left: Dimensions.width20,
    right: Dimensions.width20,
  ),
  child: TextFormField(
    decoration: InputDecoration(
      focusColor: Colors.white,
      //add prefix icon
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
      suffixIcon: Icon(Icons.toll_outlined),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1.0),
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      fillColor: Colors.grey,
      hintText: "Search",
      //make hint text
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: Dimensions.font16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),
      //create lable
      labelText: 'Search',
      //lable style
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: Dimensions.font16,
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w200,
      ),
    ),
  ),
);

titleArea(String title, String subtitle) => Container(
      margin: EdgeInsets.only(
        top: Dimensions.height15,
        bottom: Dimensions.height15,
      ),
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.font20,
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     subtitle,
          //     style: TextStyle(
          //       color: Colors.green[300],
          //       fontSize: Dimensions.font12,
          //     ),
          //   ),
          // ),
        ],
      ),
    );

var horizontalShowcase = GetBuilder<ProductController>(
  builder: (_) {
    return _.productOffer.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            height: 320,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _.productOffer.length,
              itemBuilder: (context, position) {
                return buildBigCard(_.productOffer[position]);
              },
            ),
          );
  },
);

buildBigCard(ProductModel product) => GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.getDetailsProductScreen(product.id),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        width: Dimensions.width200,
        margin: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius10),
                  topRight: Radius.circular(Dimensions.radius10),
                ),
                image: DecorationImage(
                  image: AssetImage(product.urlFoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Text(product.nome),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rate_outlined,
                  size: Dimensions.icon15,
                ),
                SizedBox(width: Dimensions.width5),
                Text(
                  '4.8',
                  style: TextStyle(fontSize: Dimensions.font12),
                ),
                SizedBox(
                  height: Dimensions.height15,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                    width: Dimensions.width20,
                  ),
                ),
                Text(
                  product.descricao,
                  style: TextStyle(
                    fontSize: Dimensions.font12,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Text('R\$ ${product.valor}'),
            SizedBox(height: Dimensions.height10),
          ],
        ),
      ),
    );

buildSmallCard(
  ProductModel product,
) =>
    GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.getDetailsProductScreen(product.id),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        width: Dimensions.width150,
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius10),
                  topRight: Radius.circular(Dimensions.radius10),
                ),
                image: DecorationImage(
                  image: AssetImage(product.urlFoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Text(product.nome),
            Wrap(
              // ignore: prefer_const_literals_to_create_immutables

              children: [
                Icon(
                  Icons.star_rate_outlined,
                  size: Dimensions.icon15,
                ),
                SizedBox(width: Dimensions.width5),
                Text(
                  product.categoria,
                  style: TextStyle(
                    fontSize: Dimensions.font10,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                  child: VerticalDivider(
                    color: Colors.black38,
                    thickness: 1,
                    endIndent: 0,
                    width: Dimensions.width10,
                  ),
                ),
                Text(
                  product.descricao,
                  style: TextStyle(
                    fontSize: Dimensions.font10,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Text('R\$ ${product.valor} '),
            SizedBox(height: Dimensions.height10)
          ],
        ),
      ),
    );

var verticalShowcaseAll = GetBuilder<ProductController>(
  builder: (products) {
    return products.productList.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productList.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(products.productList[position]);
              },
            ),
          );
  },
);

var verticalShowcaseFrutas = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryFrutas.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryFrutas.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(products.productCategoryFrutas[position]);
              },
            ),
          );
  },
);

var verticalShowcaseLegumes = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryLegumes.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryLegumes.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(
                    products.productCategoryLegumes[position]);
              },
            ),
          );
  },
);

var verticalShowcaseVerduras = GetBuilder<ProductController>(
  builder: (products) {
    return products.productCategoryHortalicas.isEmpty
        ? SpinKitCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              );
            },
          )
        : SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: products.productCategoryHortalicas.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return buildSmallCard(
                    products.productCategoryHortalicas[position]);
              },
            ),
          );
  },
);
