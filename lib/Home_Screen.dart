// ignore_for_file: prefer_const_constructors, camel_case_types, file_names, curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PostModels.dart';


class homeScreen1api extends StatefulWidget {
  const homeScreen1api({Key? key}) : super(key: key);

  @override
  State<homeScreen1api> createState() => _homeScreen1apiState();
}

class _homeScreen1apiState extends State<homeScreen1api> {
     List<PostModels> postList =[];
     Future<List<PostModels>> getPostApi() async {
     final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode==200){
       for(Map i in data){
         postList.add(PostModels.fromJson(i));
       }
      return postList;
     }
     else{
       return postList;
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
     body:Column(
       children: [
         Expanded(
           child: FutureBuilder(
               future: getPostApi(),
               builder: (context,snapshot){
                 if(!snapshot.hasData){
                   return Center(
                     child: CircularProgressIndicator(color: Colors.black),
                   );
                 }else
                 return ListView.builder(
                     itemCount: postList.length,
                     itemBuilder: (context, index){
                       return Card(
                         color: Colors.brown.shade50,
                         child: Padding(
                           padding: EdgeInsets.all(5.0),
                           child:Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("User Id",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                               Text(postList[index].id.toString()),
                               Text("Title",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                               Text(postList[index].title.toString()),
                               Text("Body",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                               Text(postList[index].body.toString()),
                            ],
                           ),
                         ),
                       );
                     }
                 );
               }
           ),
         ),
       ],
     ),
    );
  }
}
