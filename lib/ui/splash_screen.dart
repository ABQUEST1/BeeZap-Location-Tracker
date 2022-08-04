import 'dart:async';

import 'package:beezap_locate/routers/router_helper.dart';
import 'package:beezap_locate/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {


  @override
  void initState() {

    Timer(const Duration(seconds: 3), ()=> Get.toNamed(RouterHelper.loginScreen));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(Icons.add_location, color: Colors.red, size: Dimensions.height40,),
          Text("BeeZap Locate", style: TextStyle(fontSize: Dimensions.font20),),
        ],
      ),
      ),),
    );
  }
}
