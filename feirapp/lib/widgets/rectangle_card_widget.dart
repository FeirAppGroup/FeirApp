import 'package:flutter/material.dart';

import '../models/dtos/product_modeldto.dart';
import '../models/enum/situation_enum.dart';
import '../utils/app_colors.dart';
import '../utils/dimensions.dart';

class RectangleCardWidget extends StatefulWidget {
  ProductModeldto productModeldto;

  RectangleCardWidget({
    Key? key,
    required this.productModeldto,
  }) : super(key: key);

  @override
  State<RectangleCardWidget> createState() => _RectangleCardWidgetState();
}

class _RectangleCardWidgetState extends State<RectangleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(widget.productModeldto);
  }
}

var borderCard = Border(
  top: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  right: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
  left: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.black12),
);

//Card -> enabledButton é para reutilizar o card sem o botão de comentário/acompanhamento
_buildCard(ProductModeldto productModeldto) {
  return Container(
    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
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
            space5,
            Text(
              "Qtd = " + productModeldto.qtd.toString(),
              style: TextStyle(fontSize: Dimensions.font12, fontWeight: FontWeight.normal),
            ),
            space5,
            _cardSituation(_textCardSituation(productModeldto)),
            space10,
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

var space5 = SizedBox(height: Dimensions.height5);
var space10 = SizedBox(height: Dimensions.height10);
var space20 = SizedBox(height: Dimensions.height20);
