import 'package:get/get.dart';

class Dimensions {
  //851 = height
  //393 = width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height - padding and margin
  static double height5 = screenHeight / 170.2;
  static double height10 = screenHeight / 85.1;
  static double height20 = screenHeight / 42.55;
  static double height25 = screenHeight / 34.04;
  static double height30 = screenHeight / 28.36666666666667;
  static double height45 = screenHeight / 18.91111111111111;
  static double height60 = screenHeight / 14.18333333333333;
  static double height100 = screenHeight / 8.51;
  static double height120 = screenHeight / 7.091666666666667;
  static double height200 = screenHeight / 4.255;
  static double height250 = screenHeight / 3.404;
  static double height800 = screenHeight / 1.06375;

  //dynamic width - padding and margin
  static double width1 = screenWidth / screenWidth;
  static double width20 = screenWidth / 19.65;
  static double width60 = screenWidth / 6.55;
  static double width100 = screenWidth / 3.93;
  static double width250 = screenWidth / 1.572;

  //font size
  static double font10 = screenHeight / 85.1;
  static double font12 = screenHeight / 70.91666666666667;
  static double font16 = screenHeight / 53.1875;
  static double font18 = screenHeight / 47.27777777777778;
  static double font20 = screenHeight / 42.55;

  //radius
  static double radius5 = screenHeight / 170.2;
  static double radius10 = screenHeight / 85.1;
  static double radius60 = screenHeight / 14.18333333333333;
}
