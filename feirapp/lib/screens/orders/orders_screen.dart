// ignore_for_file: prefer_const_constructors

import 'package:feirapp/models/enum/situation_enum.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:feirapp/widgets/rating_widget.dart';
import 'package:feirapp/widgets/rectangle_card_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/dtos/product_modeldto.dart';
import '../../models/mock/list_product_dto_mock.dart';
import '../../routes/routes.dart';
import '../../utils/app_colors.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      top: Dimensions.height45,
      bottom: Dimensions.height20,
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
                  "Meus Pedidos",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: Dimensions.font18),
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

class _TabOrderWidgetState extends State<TabOrderWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController controllerAnimationModal;
  late FlipCardController _controllerCard;

  List<ProductModeldto> completeProductList = [];
  List<ProductModeldto> activeProductList = [];

  final ListProductDtoMock productsMockados = ListProductDtoMock();
  late ProductModeldto product;

  //Variáveis para salvar o comentário
  int _rating = 0;
  String _comment = '';

  getproducts() {
    for (var product in productsMockados.products) {
      if (product.situation == Situation.inDelivery) {
        activeProductList.add(product);
      } else if (product.situation == Situation.completed) {
        completeProductList.add(product);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _controllerCard = FlipCardController();

    controllerAnimationModal = BottomSheet.createAnimationController(this);
    controllerAnimationModal.duration = Duration(seconds: 1);
    getproducts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    controllerAnimationModal.dispose();

    super.dispose();
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
              labelPadding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryColor,
              tabs: [
                Container(
                  width: Dimensions.width100,
                  child: Tab(text: 'Ativo'),
                ),
                Container(
                  width: Dimensions.width100,
                  child: Tab(text: 'Completo'),
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
        spaceHeight20,
        Text(textOne),
        Text(textTwo),
      ],
    );
  }

  //Card -> enabledButton é para reutilizar o card sem o botão de comentário/acompanhamento
  _buildCard(ProductModeldto productModeldto, bool enabledButton) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      controller: _controllerCard,
      front: Container(
        margin: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.height20),
        height: Dimensions.height200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: borderCard,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _imageCard(productModeldto),
            _cardDescription(productModeldto),
            Icon(Icons.arrow_forward_ios_rounded, size: Dimensions.icon24),
          ],
        ),
      ),
      back: Container(
        margin: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.height20),
        height: Dimensions.height200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: borderCard,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_back_ios_rounded, size: Dimensions.icon24),
            enabledButton
                ? _buildSmallCardButton(
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
      ),
    );
  }

  var borderCard = Border(
    top: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
    right:
        BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
    bottom:
        BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
    left: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  );

  _imageCard(ProductModeldto productModeldto) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: Dimensions.width10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Dimensions.width100,
            height: Dimensions.height100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              image: DecorationImage(
                  image: AssetImage(productModeldto.urlImage ?? "")),
            ),
          ),
        ],
      ),
    );
  }

  _cardDescription(ProductModeldto productModeldto) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModeldto.name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              spaceHeight5,
              Text(
                "Qtd = " + productModeldto.qtd.toString(),
                style: TextStyle(
                    fontSize: Dimensions.font12, fontWeight: FontWeight.normal),
              ),
              spaceHeight5,
              _cardSituation(_textCardSituation(productModeldto)),
              spaceHeight10,
              Text(
                "R\$" + productModeldto.price.toString(),
                style: TextStyle(
                    fontSize: Dimensions.font16, color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
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

  _buildSmallCardButton(ProductModeldto productModeldto, String text) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: Dimensions.font18),
            ),
            Icon(Icons.arrow_right, size: Dimensions.icon30),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius60),
          ),
          primary: AppColors.primaryColor,
          fixedSize: Size.fromHeight(Dimensions.height60),
        ),
        onPressed: () {
          if (productModeldto.situation == Situation.completed) {
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
                  _modalCommentAboutProduct(context, productModeldto),
            );
          } else if (productModeldto.situation == Situation.inDelivery) {
            Get.toNamed(Routes.getTrackOrderScreen(productModeldto.id ?? 0));
          }
        },
      ),
    );
  }

  _modalCommentAboutProduct(context, ProductModeldto productModeldto) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: Dimensions.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height60, bottom: Dimensions.height30),
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
                  child: RectangleCardWidget(productModeldto: productModeldto),
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
                        style: TextStyle(
                            fontSize: Dimensions.font18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Por favor nós dê uma avaliação e também deixe seu comentário',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Dimensions.font16),
                      ),
                      spaceHeight20,
                      RatingWidget(onRatingSelected: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      }),
                      spaceHeight20,
                      TextFormField(
                        maxLength: 250,
                        minLines: 1,
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: Dimensions.font20),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Comentário',
                          labelStyle: TextStyle(
                            color: AppColors.textStyle,
                            fontSize: Dimensions.font16,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _comment = value,
                      ),
                      spaceHeight20,
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Dimensions.width20, left: Dimensions.width20),
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
                        ),
                        style: _styleElevatedButtonModal(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, //_removeProductFromCart(),
                        child: Text(
                          'Concluir',
                        ),
                        style: _styleElevatedButtonModal(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _styleElevatedButtonModal() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      primary: AppColors.primaryColor,
      fixedSize: Size(Dimensions.width150, Dimensions.height60),
    );
  }

  var spaceWidth10 = SizedBox(width: Dimensions.width10);

  var spaceHeight5 = SizedBox(height: Dimensions.height5);
  var spaceHeight10 = SizedBox(height: Dimensions.height10);
  var spaceHeight20 = SizedBox(height: Dimensions.height20);
}
