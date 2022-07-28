import 'package:feirapp/models/mock/list_product_dto_mock.dart';
import 'package:flutter/material.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../../utils/app_colors.dart';

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
        title: const Text(''),
        leading: BackButton(color: AppColors.textStyle),
      ),
      body: Container(
        child: Text(product.name),
      ),
    );
  }
}
