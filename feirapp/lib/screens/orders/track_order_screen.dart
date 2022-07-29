import 'package:feirapp/models/mock/list_product_dto_mock.dart';
import 'package:feirapp/widgets/rectangle_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class TrackOrderScreen extends StatefulWidget {
  int productIndex;
  TrackOrderScreen({
    Key? key,
    required this.productIndex,
  }) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final ListProductDtoMock mock = ListProductDtoMock();
  late ProductModeldto product;

  @override
  void initState() {
    super.initState();
    product = mock.getProduct(widget.productIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: Criar uma appbar padrão sem rota
        elevation: 0,
        toolbarHeight: 64,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.blackColor),
          ),
        ],
        title: Text(
          'Acompanhe o Pedido',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textStyle,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(color: AppColors.textStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RectangleCardWidget(productModeldto: product),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                fotosMockadas,
                fotosMockadas,
                fotosMockadas,
                fotosMockadas,
              ],
            ),
            Text(
              'Pedido em transporte',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              children: [
                Text('Detalhes do status do pedido'),
                _detailsStatus(),
              ],
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
            CircleAvatar(backgroundImage: AssetImage('images/forgot_password.jpg')),
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

  var fotosMockadas = Container(
    width: 50,
    height: 50,
    child: Image(
      image: AssetImage('assets/images/empty.png'),
    ),
  );

  _detailsStatus() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.check_circle, color: AppColors.primaryColor),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('Texto titulo'),
                  Text('Description'),
                ],
              ),
            ),
            Text('00:00'),
          ],
        ),
      ),
    );
  }
}
