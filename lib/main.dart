import 'package:beezap_locate/routers/router_helper.dart';
import 'package:beezap_locate/ui/splash_screen.dart';
import 'package:beezap_locate/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'BeeZap Locate',

      initialRoute: RouterHelper.initial,
      getPages: RouterHelper.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: AppColors.mainColor,
        ),
        fontFamily: 'Roboto',
      ),
     home: SplashScreen(),
    );
  }
}
