// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable, unused_import, use_key_in_widget_constructors, prefer_const_constructors, file_names

// import 'dart:html';

import 'package:apitutorial/CovidApp/Countriesdata.dart';
import 'package:apitutorial/Screen3Complex.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int recovered,cases,active,tests,casesPerOneMillion,todayCases;

   DetailScreen({
     required this.name,
     required this.image,
     required this.recovered,
     required this.cases,
     required this.active,
     required this.tests,
     required this.todayCases,
     required this.casesPerOneMillion,
});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: const Icon(Icons.arrow_back_ios_new,),onTap: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>CountryRecord())));},),
        elevation: 0,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body:SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20,right: 15.0,left: 15.0),
            child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*.07,),
                              Resuseable_Row(text: "Recovery", value:widget.recovered.toString()),
                              Resuseable_Row(text: "Cases", value:widget.cases.toString()),
                              Resuseable_Row(text: "Active", value:widget.active.toString()),
                              Resuseable_Row(text: "Tests", value: widget.tests.toString()),
                              Resuseable_Row(text: "TodayCases", value: widget.todayCases.toString()),
                              Resuseable_Row(text: "CasesPerOneMillion", value: widget.casesPerOneMillion.toString()),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.image),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        ),
    );
  }
}

