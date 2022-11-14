import 'package:flutter/material.dart';

import 'package:feirapp/models/dtos/product_modeldto.dart';

import '../utils/app_colors.dart';
import '../utils/dimensions.dart';
import 'rating_widget.dart';

class ModalCommentProduct extends StatefulWidget {
  ProductModeldto productModeldto;

  ModalCommentProduct({
    Key? key,
    required this.productModeldto,
  }) : super(key: key);

  @override
  State<ModalCommentProduct> createState() => _ModalCommentProductState();
}

class _ModalCommentProductState extends State<ModalCommentProduct> with TickerProviderStateMixin {
  int _rating = 0;
  String _comment = '';

  late TabController _tabController;
  late AnimationController controllerAnimationModal;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    controllerAnimationModal = BottomSheet.createAnimationController(this);
    controllerAnimationModal.duration = Duration(seconds: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    controllerAnimationModal.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  //child: _buildCard(productModeldto, false),
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
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      RatingWidget(onRatingSelected: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      }),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      TextFormField(
                        maxLength: 250,
                        minLines: 1,
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Comentário',
                          labelStyle: TextStyle(
                            color: AppColors.textStyle,
                            fontSize: 16,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _comment = value,
                      ),
                      SizedBox(
                        height: 20,
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
      ),
    );
  }
}
