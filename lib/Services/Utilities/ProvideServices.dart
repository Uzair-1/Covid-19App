// ignore_for_file: file_names, unused_import, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:apitutorial/Services/Utilities/app_Url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../Models/WorldStatesModel.dart';

class StatesServices{
  // For WorldStatesList
  Future<WorldStatesModel> FetchworldStates() async{
    final response=  await http.get(Uri.parse(AppUrl.worldStatesApi),);
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
  // for Countries data,
  // most important for that dynamic design is beacause the List is start form the Array...
  Future<List<dynamic>> CountryListApi() async{
    var data;
    final response=  await http.get(Uri.parse(AppUrl.countriesListApi),);
    data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return data;
    }else{
      throw Exception('Error');
    }
  }
}