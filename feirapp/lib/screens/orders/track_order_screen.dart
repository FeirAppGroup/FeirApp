import 'package:feirapp/models/dtos/details_order_modeldto.dart';
import 'package:feirapp/models/mock/list_product_dto_mock.dart';
import 'package:feirapp/widgets/rectangle_card_widget.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../../models/mock/list_details_product_dto_mock.dart';
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
  final ListDetailsOrderDtoMock mockDetails = ListDetailsOrderDtoMock();

  late ProductModeldto product;
  late List<DetailsOrderModeldto> detailsOrder;

  @override
  void initState() {
    super.initState();
    product = mock.getProduct(widget.productIndex);
    detailsOrder = mockDetails.getDetailsOrder(widget.productIndex);
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
            fontSize: Dimensions.font18,
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
                Icon(
                  UniconsLine.box,
                  size: Dimensions.icon40,
                  color: AppColors.primaryColor,
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    UniconsLine.truck,
                    size: Dimensions.icon40,
                    color: AppColors.primaryColor,
                  ),
                ),
                Icon(
                  UniconsLine.truck_loading,
                  size: Dimensions.icon40,
                  color: AppColors.greyColor,
                ),
                Icon(
                  UniconsLine.dropbox,
                  size: Dimensions.icon40,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            Text(
              'Pedido em transporte',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dividerLine,
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: Text('Detalhes do status do pedido'),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: detailsOrder.length,
                    itemBuilder: (context, index) {
                      return _detailsStatus(detailsOrder[index]);
                    }),
                //_detailsStatus(),
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

  var dividerLine = Container(
    margin: EdgeInsets.only(top: Dimensions.height10),
    child: Divider(
      color: AppColors.greyColor,
      thickness: 2,
      indent: Dimensions.width20,
      endIndent: Dimensions.width20,
    ),
  );

  _detailsStatus(DetailsOrderModeldto detailsOrderModeldto) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.primaryColor,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailsOrderModeldto.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detailsOrderModeldto.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(detailsOrderModeldto.time),
        ],
      ),
    );
  }
}
