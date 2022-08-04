import 'package:get/get.dart';

class Dimensions {
  //851 = height
  //393 = width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height - padding and margin
  static double height5 = screenHeight / 170.2;
  static double height10 = screenHeight / 85.1;
  static double height15 = screenHeight / 56.73;
  static double height20 = screenHeight / 42.55;
  static double height25 = screenHeight / 34.04;
  static double height30 = screenHeight / 28.37;
  static double height45 = screenHeight / 18.91;
  static double height60 = screenHeight / 14.18;
  static double height100 = screenHeight / 8.51;
  static double height120 = screenHeight / 7.09;
  static double height200 = screenHeight / 4.25;
  static double height250 = screenHeight / 3.40;
  static double height800 = screenHeight / 1.06;

  //dynamic width - padding and margin
  static double width1 = screenWidth / screenWidth;
  static double width5 = screenWidth / 78.6;
  static double width10 = screenWidth / 39.3;
  static double width20 = screenWidth / 19.65;
  static double width50 = screenWidth / 7.86;
  static double width60 = screenWidth / 6.55;
  static double width100 = screenWidth / 3.93;
  static double width150 = screenWidth / 2.62;
  static double width200 = screenWidth / 1.96;
  static double width250 = screenWidth / 1.572;

  //font size
  static double font10 = screenHeight / 85.1;
  static double font12 = screenHeight / 70.91;
  static double font16 = screenHeight / 53.18;
  static double font18 = screenHeight / 47.27;
  static double font20 = screenHeight / 42.55;

  //radius
  static double radius5 = screenHeight / 170.2;
  static double radius10 = screenHeight / 85.1;
  static double radius20 = screenHeight / 42.55;
  static double radius40 = screenHeight / 21.27;
  static double radius60 = screenHeight / 14.18;

  //icon
  static double icon15 = screenHeight / 56.73;
  static double icon24 = screenHeight / 35.46;
  static double icon30 = screenHeight / 28.36;
  static double icon40 = screenHeight / 21.27;
}
