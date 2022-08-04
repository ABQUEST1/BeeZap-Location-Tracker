import 'package:beezap_locate/ui/dashboard_screen.dart';
import 'package:beezap_locate/ui/map_view.dart';
import 'package:beezap_locate/ui/register_screen.dart';
import 'package:beezap_locate/ui/splash_screen.dart';
import 'package:get/get.dart';

import '../ui/login_screen.dart';

class RouterHelper{
  static const String initial = "/splash-screen";
  static const String loginScreen = "/login-screen";
  static const String registerScreen = "/register-screen";
  static const String dashboardScreen = "/dashboard-screen";
  static const String mapViewScreen = "/map-view-screen";

  static String getInitial() => '$initial';
  static String getLoginScreen() => '$loginScreen';
  static String getRegisterScreen() => '$registerScreen';
  static String getDashboardScreen() => '$dashboardScreen';
  static String getMapViewScreen() => '$mapViewScreen';

  static List<GetPage> routes = [

    GetPage(name: initial, page: ()=> const SplashScreen()),

    GetPage(
        name: loginScreen,
        page: () {
          return LoginScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: registerScreen,
        page: () {
          return RegisterScreen();
        },
        transition: Transition.fadeIn),


    GetPage(
        name: dashboardScreen,
        page: () {
          return DashboardScreen();
        },
        transition: Transition.fadeIn),

    GetPage(
        name: mapViewScreen,
        page: () {
          return MapView();
        },
        transition: Transition.fadeIn),
  ];
}