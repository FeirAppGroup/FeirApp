import 'package:feirapp/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/splash-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';

  static String getSplashScreen() => splashScreen;
  static String getWelcomeScreen() => welcomeScreen;
  static String getLoginScreen() => loginScreen;

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
  ];
}
