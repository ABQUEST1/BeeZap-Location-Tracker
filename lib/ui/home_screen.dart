import 'package:beezap_locate/routers/router_helper.dart';
import 'package:beezap_locate/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.asset("assets/images/main_image.png") , 
            
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: (){

                  Get.toNamed(RouterHelper.mapViewScreen);
                } ,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    )),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(AppColors.mainColor)
                ),

                child: Text("Start Destination"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
