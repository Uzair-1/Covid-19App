// ignore_for_file: file_names, prefer_const_constructors

import 'package:apitutorial/CovidApp/HomeScreen.dart';
import 'package:apitutorial/CovidApp/detailsScreen.dart';
import 'package:apitutorial/Services/Utilities/ProvideServices.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
//import 'dart:ui';

class CountryRecord extends StatefulWidget {
  const CountryRecord({Key? key}) : super(key: key);

  @override
  State<CountryRecord> createState() => _CountryRecordState();
}

class _CountryRecordState extends State<CountryRecord> {
  TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices= StatesServices();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios_new,),onTap: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>HomeScreen())));},),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value){
                setState(() {

                });
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  hintText: "Search for country name",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
          ),
         Expanded(
           child: FutureBuilder(
               future: statesServices.CountryListApi(),
               builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                 if(!snapshot.hasData){
                 return ListView.builder(
                     itemCount:10,
                     itemBuilder: (context,index){
                       return Shimmer.fromColors(
                           baseColor: Colors.grey.shade50,
                           highlightColor: Colors.grey.shade100,
                         child: Column(
                           children: [
                             InkWell(
                               onTap: (){
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                   image: snapshot.data![index]["countryInfo"]["flag"],
                                   name: snapshot.data![index]["country"],
                                   recovered: snapshot.data![index]["recovered"],
                                   cases: snapshot.data![index]["cases"],
                                   active: snapshot.data![index]["active"],
                                   tests: snapshot.data![index]["tests"],
                                   casesPerOneMillion: snapshot.data![index]["casesPerOneMillion"],
                                   todayCases:   snapshot.data![index]["todayCases"],
                                   //   todayRecovered:  snapshot.data![index]["todayRecovered"],
                                 )));
                               },
                               child: ListTile(
                                 title:Container(height: 10,width: 89,color: Colors.white,),
                                 subtitle:Container(height: 10,width: 89,color: Colors.white,),
                                 leading: Container(height: 50,width: 50,color: Colors.white,),
                               ),
                             ),
                           ],
                         ),
                       );
                     }
                 );
                 }else{
                 return ListView.builder(
                      itemCount:snapshot.data!.length,
                       itemBuilder: (context,index){
                        String name=snapshot.data![index]["country"];
                        if(searchController.text.isEmpty){
                          return Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                      image: snapshot.data![index]["countryInfo"]["flag"],
                                      name: snapshot.data![index]["country"],
                                      recovered: snapshot.data![index]["recovered"],
                                      cases: snapshot.data![index]["cases"],
                                      active: snapshot.data![index]["active"],
                                      tests: snapshot.data![index]["tests"],
                                      casesPerOneMillion: snapshot.data![index]["casesPerOneMillion"],
                                      todayCases:   snapshot.data![index]["todayCases"],
                                    //   todayRecovered:  snapshot.data![index]["todayRecovered"],
                                  )));
                                },
                                child:ListTile(
                                  title:Text(snapshot.data![index]["country"]),
                                  subtitle:Text(snapshot.data![index]["cases"].toString()),
                                  leading: Image(
                                    height:50,
                                    width: 50,
                                    image:NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                          return Column(
                            children: [
                             InkWell(
                               onTap: (){
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                   image: snapshot.data![index]["countryInfo"]["flag"],
                                   name: snapshot.data![index]["country"],
                                   recovered: snapshot.data![index]["recovered"],
                                   cases: snapshot.data![index]["cases"],
                                   active: snapshot.data![index]["active"],
                                   tests: snapshot.data![index]["tests"],
                                   casesPerOneMillion: snapshot.data![index]["casesPerOneMillion"],
                                   todayCases:   snapshot.data![index]["todayCases"],
                                   //   todayRecovered:  snapshot.data![index]["todayRecovered"],
                                 )));
                               },
                               child: ListTile(
                                 title:Text(snapshot.data![index]["country"]),
                                 subtitle:Text(snapshot.data![index]["cases"].toString()),
                                 leading: Image(
                                   height:50,
                                   width: 50,
                                   image:NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),
                                 ),
                               ),
                             ),
                            ],
                          );
                        }else{
                          return Container();
                        }
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
