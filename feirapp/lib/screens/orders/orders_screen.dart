import 'package:feirapp/models/enum/situation_enum.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../../models/dtos/product_modeldto.dart';
import '../../utils/app_colors.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerApp,
            SingleChildScrollView(
              child: TabOrderWidget(),
            ),
          ],
        ),
      ),
    );
  }

  var headerApp = Container(
    margin: EdgeInsets.only(
      top: 45,
      bottom: 20,
    ),
    padding: EdgeInsets.only(
      left: 20,
      right: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('images/forgot_password.jpg')),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  "Meus Pedidos",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
      ],
    ),
  );
}

class TabOrderWidget extends StatefulWidget {
  const TabOrderWidget({Key? key}) : super(key: key);

  @override
  State<TabOrderWidget> createState() => _TabOrderWidgetState();
}

class _TabOrderWidgetState extends State<TabOrderWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<ProductModeldto> activeProductList = [
  //   ProductModeldto(
  //     name: 'Alface',
  //     price: 4.5,
  //     qtd: 2,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Maçã',
  //     price: 5,
  //     qtd: 7,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Banana',
  //     price: 4,
  //     qtd: 12,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Alface',
  //     price: 4.5,
  //     qtd: 2,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Maçã',
  //     price: 5,
  //     qtd: 7,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Banana',
  //     price: 4,
  //     qtd: 12,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Alface',
  //     price: 4.5,
  //     qtd: 2,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Maçã',
  //     price: 5,
  //     qtd: 7,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Banana',
  //     price: 4,
  //     qtd: 12,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Alface',
  //     price: 4.5,
  //     qtd: 2,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'Maçã',
  //     price: 5,
  //     qtd: 7,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  //   ProductModeldto(
  //     name: 'teste',
  //     price: 4,
  //     qtd: 12,
  //     urlImage: 'assets/images/logo.png',
  //     situation: Situation.inDelivery,
  //   ),
  // ];
  List<ProductModeldto> completeProductList = [
    ProductModeldto(
      name: 'Alface',
      price: 4.5,
      qtd: 2,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      name: 'Maçã',
      price: 5,
      qtd: 7,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
    ProductModeldto(
      name: 'Banana',
      price: 4,
      qtd: 12,
      urlImage: 'assets/images/logo.png',
      situation: Situation.completed,
    ),
  ];
  //List<ProductModeldto> completeProductList = [];
  List<ProductModeldto> activeProductList = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryColor,
              tabs: [
                Container(
                  child: Tab(text: 'Ativo'),
                  width: Dimensions.width100,
                ),
                Container(
                  child: Tab(text: 'Completo'),
                  width: Dimensions.width100,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: deviceInfo.size.height - 200,
          padding: EdgeInsets.only(
            bottom: Dimensions.height30,
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              activeProductList.isEmpty
                  ? _buildTabContentEmpty(
                      'assets/images/empty.png',
                      'Você não tem pedidos ainda',
                      'Você não tem pedidos ativos no momento',
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: activeProductList.length,
                      itemBuilder: (context, index) {
                        return _buildCard(activeProductList[index], true);
                      }),
              completeProductList.isEmpty
                  ? _buildTabContentEmpty(
                      'assets/images/empty.png',
                      'Você não tem pedidos concluídos',
                      'Faça um pedido',
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: completeProductList.length,
                      itemBuilder: (context, index) {
                        return _buildCard(completeProductList[index], true);
                      }),
            ],
          ),
        ),
      ],
    );
  }

  _buildTabContentEmpty(String image, String textOne, String textTwo) {
    return Column(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: Dimensions.height20),
        Text(textOne),
        Text(textTwo),
      ],
    );
  }

  _buildCard(ProductModeldto productModeldto, bool enabledButton) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
      height: Dimensions.height200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        border: Border(
          top: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
          right: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
          bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
          left: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _imageCard(productModeldto),
          _cardDescription(productModeldto),
          enabledButton
              ? _buildSmallButton(
                  productModeldto,
                  productModeldto.situation == Situation.completed
                      ? 'Deixe um comentário'
                      : productModeldto.situation == Situation.inDelivery
                          ? 'Acompanhar Pedido'
                          : '',
                )
              : Container(),
        ],
      ),
    );
  }

  _imageCard(ProductModeldto productModeldto) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Dimensions.width100,
          height: Dimensions.height100,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            image: DecorationImage(image: AssetImage(productModeldto.urlImage ?? "")),
          ),
        ),
      ],
    );
  }

  _cardDescription(ProductModeldto productModeldto) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: Dimensions.height10),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModeldto.name,
                style: TextStyle(fontSize: Dimensions.font20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: Dimensions.height5),
              Text(
                "Qtd = " + productModeldto.qtd.toString(),
                style: TextStyle(fontSize: Dimensions.font12, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: Dimensions.height5),
              _cardSituation(_textCardSituation(productModeldto)),
              SizedBox(height: Dimensions.height10),
              Text(
                "R\$" + productModeldto.price.toString(),
                style: TextStyle(fontSize: Dimensions.font20, color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _cardSituation(String text) {
    return Container(
      width: Dimensions.width60,
      height: Dimensions.height25,
      decoration: BoxDecoration(
        color: AppColors.primaryColorLight,
        borderRadius: BorderRadius.circular(Dimensions.radius5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: Dimensions.font10,
            color: AppColors.textStyle,
          ),
        ),
      ),
    );
  }

  _textCardSituation(ProductModeldto productModeldto) {
    if (productModeldto.situation == Situation.inDelivery) {
      return 'A caminho';
    } else if (productModeldto.situation == Situation.completed) {
      return 'Completado';
    } else {
      return 'Cancelado';
    }
  }

  _buildSmallButton(ProductModeldto productModeldto, String text) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Dimensions.font10),
            ),
            Icon(Icons.arrow_circle_right),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius60),
          ),
          primary: AppColors.primaryColor,
          fixedSize: Size(Dimensions.width100, Dimensions.height60),
        ),
        onPressed: () {
          if (productModeldto.situation == Situation.completed) {
            showModalBottomSheet(
              context: context,
              builder: (context) => _modalCommentAboutProduct(context, productModeldto),
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Dimensions.radius40),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  _modalCommentAboutProduct(context, ProductModeldto productModeldto) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: Dimensions.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height60, bottom: Dimensions.height30),
                child: Text(
                  'Deixe um Comentário',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: _buildCard(productModeldto, false),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'O que achou de seu pedido?',
                      style: TextStyle(fontSize: Dimensions.font18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Por favor nós dê uma avaliação e também deixe seu comentário',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                      ),
                    ),
                    Icon(Icons.star),
                    Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: AppColors.backgroundIconColor,
                        fixedSize: Size(
                          150,
                          60,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, //_removeProductFromCart(),
                      child: Text(
                        'Concluir',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        primary: AppColors.primaryColor,
                        fixedSize: Size(
                          150,
                          60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _ratingStars() {}
}
