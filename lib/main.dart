// ignore_for_file: unused_import, prefer_const_constructors

import 'package:apitutorial/CovidApp/Countriesdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'CovidApp/HomeScreen.dart';
import 'CovidApp/splachscreen.dart';
import 'CreateownModels.dart';
import 'Home_Screen.dart';
import 'Screen3Complex.dart';
import 'login/signupapi.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: SplachScreen(),
    );
  }
}
