import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../utils/firebase_auth.dart';
import '../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.red,),
                  Text("BeeZap Locate"),
                  SizedBox(
                    height: 20,
                  ),
                  Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Name"),
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "User Name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26
                                )
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Password"),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration:const InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26
                                )
                            )
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 10,),

                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {


                              User? user = await FireAuth.signInUsingEmailPassword(email: "ankugaur999@gmail.com", password: "12345*");


                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              )),
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                              backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                            ),
                            child: Text("Login"),
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              );
            },

          ),
        ),
      )),
    );
  }

}
