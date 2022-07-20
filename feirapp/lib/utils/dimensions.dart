import 'package:get/get.dart';

class Dimensions {
  //844 é a tela padrao do iphone 12 - com isso dividimos pelas alturas que queriamos
  //390 = width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height - padding and margin
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 33.76;
  static double height30 = screenHeight / 28.13;
  static double height100 = screenHeight / 8.44;
  static double height120 = screenHeight / 7.03;
  static double height800 = screenHeight / 1.055;

  //dynamic width - padding and margin
  static double width20 = screenWidth / 19.5;
  static double width60 = screenWidth / 6.5;
  static double width100 = screenWidth / 3.9;
  static double width250 = screenWidth / 1.56;

  //font size
  static double font10 = screenHeight / 84.4;
  static double font12 = screenHeight / 70.33;
  static double font16 = screenHeight / 52.75;
  static double font18 = screenHeight / 46.88;

  //radius
  static double radius5 = screenHeight / 168.8;
  static double radius10 = screenHeight / 84.4;
  static double radius60 = screenHeight / 14.06;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
}
