// ignore_for_file: camel_case_types, file_names, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homeScreen2api extends StatefulWidget {
  const homeScreen2api({Key? key}) : super(key: key);

  @override
  State<homeScreen2api> createState() => _homeScreen2apiState();
}

class _homeScreen2apiState extends State<homeScreen2api> {

  List<Photos> getPhotos=[];
  Future<List<Photos>> getPhotosapi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
       Photos photos=(Photos(title: i["title"], url: i["url"], id: i["id"]));
       getPhotos.add(photos);
      } return getPhotos;
    }else{
      return getPhotos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade200,
        title: Text("API'S"),
        leading: const Icon(Icons.flutter_dash_rounded),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotosapi(),
                builder:(context, AsyncSnapshot<List<Photos>> snapshot){
                  return ListView.builder(
                    itemCount: getPhotos.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image.network(snapshot.data![index].url.toString()),
                          ),
                          subtitle: Text("Notes ID:" +snapshot.data![index].id.toString()),
                          title: Text("Description:\n"+snapshot.data![index].title.toString()),
                        );
                      }
                  );
                }
            )
          ),
        ],
      ),
    );
  }
}
//Create Own model if Pluging not create this.
class Photos{
  String title,url;
  int id;
  Photos({required this.title,required this.url,required this.id}); //Create Constructor and passing parameters
}

