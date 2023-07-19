// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/UserModels.dart';

class Screen3complexapi extends StatefulWidget {
  const Screen3complexapi({Key? key}) : super(key: key);

  @override
  State<Screen3complexapi> createState() => _Screen3complexapiState();
}

class _Screen3complexapiState extends State<Screen3complexapi> {

  List<UserModels> userList=[];
  Future<List<UserModels>> getUserapi() async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModels.fromJson(i));
      }return userList;
    }else{
      return userList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade200,
        title: Text("API'S"),
        leading: Icon(Icons.flutter_dash_rounded),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserapi(),
                builder:(context,AsyncSnapshot<List<UserModels>>snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else {
                  return ListView.builder(
                    itemCount: userList.length,
                      itemBuilder: (context,index){
                        return Card(
                          color: Colors.brown.shade100,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child:Column(
                              children: [
                                Reuse_row(title: ("Name:"),value: snapshot.data![index].name.toString()),
                                Reuse_row(title: ("Company:"),value: snapshot.data![index].company.toString()),
                                Reuse_row(title: ("Email:"),value: snapshot.data![index].email.toString()),
                                Reuse_row(title: ("Address:"),value: snapshot.data![index].address!.city.toString()),
                                Reuse_row(title: ("Geo:"),value: snapshot.data![index].address!.geo!.lat.toString()),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
                }
            ),
          ),
        ],
      ),
    );
  }
}
class Reuse_row extends StatelessWidget {
  String title,value;
  Reuse_row({Key? key, required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5.0),
    child: Row(
      children: [
        Text(title),
        Text(value),
      ],
    ),
    );
  }
}


