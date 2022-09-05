// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:feirapp/screens/forgot-password/create_new_password_screen.dart';
import 'package:feirapp/screens/forgot-password/forgot_password_code_screen.dart';
import 'package:feirapp/screens/forgot-password/forgot_password_screen.dart';
import 'package:feirapp/screens/home/home_screen.dart';
import 'package:feirapp/screens/home/tab_screen.dart';
import 'package:feirapp/screens/my-cart/my_cart_checkout_screen.dart';
import 'package:feirapp/screens/payment/add_payment_method_screen.dart';
import 'package:feirapp/screens/payment/payment_methods_screen.dart';

import 'package:feirapp/screens/shipping-address/shipping_address_screen.dart';

import 'package:feirapp/screens/orders/orders_screen.dart';
import 'package:feirapp/screens/orders/track_order_screen.dart';

import 'package:feirapp/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/splash-screen';
  //welcome
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  //forgot password
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String forgotPasswordCodeScreen = '/forgot-password-code-screen';
  static const String createNewPasswordScreen = '/create-password-screen';
  //home
  static const String tabScreen = '/tab-screen';
  static const String mainScreen = '/main-screen';

  //my cart
  static const String checkoutScreen = '/checkout';
  static const String shippingAddressScreen = '/shipping-address';

  //payment
  static const String paymentMethodsScreen = '/payment-methods';
  static const String addPaymentMethodScreen = '/add-payment-methods';

  //orders
  static const String ordersScreen = '/orders-screen';
  static const String trackOrderScreen = '/trackorders-screen';

  static String getSplashScreen() => '$splashScreen';
  //welcome
  static String getWelcomeScreen() => '$welcomeScreen';
  static String getLoginScreen() => '$loginScreen';
  static String getRegisterScreen() => '$registerScreen';
  //forgot password
  static String getForgotPasswordScreen() => '$forgotPasswordScreen';
  static String getForgotPasswordCodeScreen() => '$forgotPasswordCodeScreen';
  static String getCreateNewPasswordScreen() => '$createNewPasswordScreen';
  //home
  static String getTabScreen() => '$tabScreen';
  static String getMainScreen() => '$mainScreen';

  //mycart
  static String getCheckoutScreen() => '$checkoutScreen';
  static String getShippingAddressScreen() => '$shippingAddressScreen';

  //payment
  static String getPaymentMethodsScreen() => '$paymentMethodsScreen';
  static String getAddPaymentMethodScreen() => '$addPaymentMethodScreen';

  //orders
  static String getOrdersScreen() => '$ordersScreen';
  static String getTrackOrderScreen() => '$trackOrderScreen';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: forgotPasswordCodeScreen,
      page: () => ForgotPasswordCodeScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: tabScreen,
      page: () => TabScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: mainScreen,
      page: () => HomeScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: checkoutScreen,
      page: () => MyCartCheckoutScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: shippingAddressScreen,
      page: () => ShippingAddressScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: paymentMethodsScreen,
      page: () => PaymentMethodsScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: addPaymentMethodScreen,
      page: () => AddPaymentMethodScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: ordersScreen,
      page: () => OrdersScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: trackOrderScreen,
      page: () => TrackOrderScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
