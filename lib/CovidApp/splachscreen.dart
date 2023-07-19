// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'dart:async';

import 'package:apitutorial/login/signupapi.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'HomeScreen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> with TickerProviderStateMixin {
  
  late final AnimationController _controller= AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), ()=> { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sign_In()))});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Colors.brown.shade50,*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           AnimatedBuilder(
             child: Container(
               height: 200,
               width: 200,
               child: Center(
                 child: Image(
                   image: AssetImage('images/virus.png'),
                 ),
               ),
             ),
               animation: _controller,
               builder: (BuildContext context, Widget? child){
                 return Transform.rotate(
                   angle: _controller.value*2.0 * math.pi,
                   child: child,
                 );
               }
           ),
          SizedBox(height: MediaQuery.of(context).size.height* 0.08,),
          Align(
            child: Text("Covid-19\nTracker App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
          ),
        ],
      ),
    );
  }
}
