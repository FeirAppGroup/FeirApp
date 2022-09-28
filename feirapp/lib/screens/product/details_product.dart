import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsProductScreen extends StatefulWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  bool _favorite = false;
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 70,
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'Preço Total',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: AppColors.greyColor),
                  ),
                  Text(
                    'R\$72',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  primary: AppColors.primaryColor,
                ),
                onPressed: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Adicionar ao Carrinho',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Urbanist',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: BackButton(),
                alignment: Alignment.topLeft,
              ),
              Center(child: Image.asset("assets/images/alface.png")),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alface',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: AppColors.blackColor),
                  ),
                  IconButton(
                      onPressed: () => setState(() {
                            _favorite = !_favorite;
                          }),
                      icon: !_favorite
                          ? Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryColor,
                            )
                          : Icon(
                              Icons.favorite,
                              color: AppColors.primaryColor,
                            ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 1,
                color: AppColors.blackColor.withOpacity(0.2),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Descrição',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.blackColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'A alface é uma verdura rica em fibras e antioxidantes que deve ser incluída na alimentação do dia a dia porque pode trazer diversos benefícios para a saúde, como favorecer a perda de peso, melhora da saúde gastrointestinal e regulação dos níveis de açúcar no sangue',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackColor),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Quantidade',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.blackColor),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () => {
                            if (_quantity == 0)
                              {_quantity == 0}
                            else
                              setState(() {
                                _quantity--;
                              })
                          },
                      icon: Icon(
                        Icons.remove,
                        color: AppColors.primaryColor,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$_quantity',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () => setState(() {
                            _quantity++;
                          }),
                      icon: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      )),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
