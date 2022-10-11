// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerApp,
            searchBar,
            titleArea('Ofertas Especiais', 'Ver todos'),
            horizontalShowcase,
            dividerLine,
            horizontalFilters,
            dividerLine,
            titleArea('Ofertas Especiais', 'Ver todos'),
            verticalShowcase,
          ],
        ),
      ),
    );
  }
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
          Text(title),
          GestureDetector(
            onTap: () {},
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.green[300],
                fontSize: Dimensions.font12,
              ),
            ),
          ),
        ],
      ),
    );

var horizontalShowcase = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      buildBigCard('Nome Item', '', '47', '3.5'),
      buildBigCard('Nome Item', '', '47', '3.5'),
      buildBigCard('Nome Item', '', '47', '3.5'),
    ],
  ),
);

buildBigCard(
  String name,
  String? starred,
  String salesAmount,
  String price,
) =>
    Container(
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
                image: AssetImage('images/forgot_password.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10),
          Text(name),
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
                '$salesAmount vendidos',
                style: TextStyle(
                  fontSize: Dimensions.font12,
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height10),
          Text('R\$ $price'),
          SizedBox(height: Dimensions.height10),
        ],
      ),
    );

buildSmallCard(
  ProductModel product,
) =>
    GestureDetector(
      onTap: () {
        Get.find<ProductController>().getProductDetails(product.id);
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
              height: Dimensions.height100,
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

var verticalShowcase = SizedBox(
  width: double.infinity,
  child: GetBuilder<ProductController>(
    builder: (products) {
      return SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: products.productCategoryFrutas.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, position) {
              return buildSmallCard(products.productCategoryFrutas[position]);
            }),
      );
    },
  ),
);

filterContent(String text) => Container(
      width: Dimensions.width60,
      height: Dimensions.height30,
      margin: EdgeInsets.fromLTRB(
        Dimensions.width5,
        Dimensions.height10,
        Dimensions.width5,
        0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        color: Colors.greenAccent,
      ),
      child: Center(
        child: Text(text),
      ),
    );

var horizontalFilters = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      //TODO: ver como podemos fazer aqui para criar um selected list e mostrar a lista de produtos de acordo com o que estiver selecionado.
      filterContent('Frutas'),
      filterContent('Legumes'),
      filterContent('Verduras'),
    ],
  ),
);
