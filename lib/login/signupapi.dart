// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, non_constant_identifier_names
//


import 'package:apitutorial/login/signup.dart';
import 'package:flutter/material.dart';

import '../CovidApp/HomeScreen.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      // backgroundColor: Colors.white,
      child: Scaffold(
        body: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              const Center(
                  child: Text("Sign In",
                    style: TextStyle(fontSize: 30,color: Colors.white),
                  )
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.blueGrey[10],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 10),
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blueGrey[10],
                    ),
                    suffixIcon: const Icon(Icons.visibility,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Sign_up(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Create Account", style: const TextStyle(
                        fontSize: 13, color: Colors.white),),],
                ),
              ),
              const SizedBox(height: 90,),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
                },
                borderRadius: BorderRadius.circular(20),
                child:  Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(" Sign In ",style: TextStyle(fontSize: 20,color: Colors.white),)

                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
































// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:http/http.dart' as http;
//
// import '../CovidApp/HomeScreen.dart';
//
// class Login4 extends StatefulWidget {
//   const Login4({Key? key}) : super(key: key);
//
//   @override
//   State<Login4> createState() => _Login4State();
// }
//
// class _Login4State extends State<Login4> {
//   void LogIn(String email,password) async{
//     try{
//       Response response=await post(
//         Uri.parse("https://reqres.in/api/login"),
//         body: {
//           "email": email,
//           "password": password,
//         }
//       );
//       if(response.statusCode==200){
//         var data =jsonDecode(response.body.toString());
//         print(data["token"]);
//         print("Created");
//       }else{
//         print("UnCreated");
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor:  Colors.white,
//       // appBar: AppBar(
//       //   backgroundColor: Colors.brown.shade200,
//       //   title: Text("Login API'S"),
//       //   leading: Icon(Icons.flutter_dash_rounded),
//       //   elevation: 0,
//       // ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//          Padding(padding: EdgeInsets.all(10),
//          child: TextField(
//            controller: emailController,
//            textAlign: TextAlign.start,
//            decoration: InputDecoration(
//              hintText: "eve.holt@reqres.in",
//            ),
//          ),
//          ),
//           Padding(padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: passwordController,
//               textAlign: TextAlign.start,
//               decoration: InputDecoration(
//                 hintText: "pistol",
//               ),
//             ),
//           ),
//           Padding(padding: EdgeInsets.all(30),
//           child: SizedBox(
//             height: 70,
//             child: GestureDetector(
//               onTap: (){
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (ccntext)=>HomeScreen()));
//                //  LogIn(
//                //   emailController.text.toString(),
//                //   passwordController.text.toString(),
//                // );
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 color: Colors.green,
//                 child: Text("lOG IN"),
//               ),
//             ),
//           ),
//           ),
//         ],
//       ),
//     );
//   }
// }
