// ignore_for_file: prefer_const_constructors

import 'package:feirapp/screens/forgot-password/create_new_password_screen.dart';
import 'package:feirapp/screens/forgot-password/forgot_password_code_screen.dart';
import 'package:feirapp/screens/forgot-password/forgot_password_screen.dart';
import 'package:feirapp/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/splash-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';

  static String getSplashScreen() => splashScreen;
  static String getWelcomeScreen() => welcomeScreen;
  static String getLoginScreen() => loginScreen;
  static String getRegisterScreen() => registerScreen;
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String forgotPasswordCodeScreen = '/forgot-password-code-screen';
  static const String createNewPasswordScreen = '/create-password-screen';

  static String getSplashScreen() => splashScreen;
  static String getWelcomeScreen() => welcomeScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getForgotPasswordCodeScreen() => forgotPasswordCodeScreen;
  static String getCreateNewPasswordScreen() => createNewPasswordScreen;


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
  ];
}
