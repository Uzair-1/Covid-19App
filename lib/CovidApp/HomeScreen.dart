// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, must_be_immutable, file_names, non_constant_identifier_names

import 'package:apitutorial/CovidApp/Countriesdata.dart';
import 'package:apitutorial/login/signupapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Models/WorldStatesModel.dart';
import '../Services/Utilities/ProvideServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

 late final AnimationController _controller=AnimationController(
     duration: Duration(seconds: 3),
     vsync: this)..repeat();

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final Listcolor =[
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices= StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
         actions: [
          Padding(padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(Icons.logout_rounded),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sign_In()));
            },
          ),
          ),
         ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                FutureBuilder(
                    future: statesServices.FetchworldStates(),
                    builder: (context, AsyncSnapshot<WorldStatesModel> snapshot){
                     if(!snapshot.hasData){
                       return Expanded(
                         flex: 0,
                               child: SpinKitFadingCircle(
                                 controller: _controller,
                                 size: 50.0,
                                 color: Colors.white,
                               ),
                       );
                     } else{
                       return Column(
                         children: [
                           PieChart(
                             dataMap:{
                               "Totals": double.parse(snapshot.data!.cases!.toString()),
                               "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                               "Deaths": double.parse(snapshot.data!.deaths!.toString()),
                             },
                             chartValuesOptions: const ChartValuesOptions(
                               showChartValuesInPercentage: true,
                             ),
                             chartRadius: MediaQuery.of(context).size.width/3.5,
                             animationDuration: Duration(milliseconds: 1500),
                             legendOptions: LegendOptions(
                               legendPosition: LegendPosition.left,
                             ),
                             chartType: ChartType.ring,
                             ringStrokeWidth: 14.0,
                             colorList: Listcolor,
                           ),
                           SizedBox(height: 10,),
                           Padding(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06),
                             child:  Card(
                               child: Column(
                                 children: [
                                   Resuseable_Row(text: "Updated", value: snapshot.data!.updated!.toString()),
                                   Resuseable_Row(text: "population", value: snapshot.data!.population!.toString()),
                                   Resuseable_Row(text: "Total", value: snapshot.data!.cases!.toString()),
                                   Resuseable_Row(text: "Recovered", value: snapshot.data!.recovered!.toString()),
                                   Resuseable_Row(text: "Deaths", value: snapshot.data!.deaths!.toString()),
                                   Resuseable_Row(text: "tests", value: snapshot.data!.tests!.toString()),
                                 ],
                               ),
                             ),
                           ),
                         Padding(padding: EdgeInsets.only(top: 10),
                          child:  GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>CountryRecord())));
                            },
                            child:Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child:Text("Track Countries",style: TextStyle(color: Colors.white,),),
                                )
                            ),
                          ),
                         ),
                         ],
                       );
                     }
                    }),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class Resuseable_Row extends StatelessWidget {
  String text,value;
  Resuseable_Row({Key? key,required this.text,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,style: TextStyle(color: Colors.white),),
                Text(value,style: const TextStyle(color: Colors.white),),
              ],
            ),
            SizedBox(height: 5.0,),
            Divider(),
          ],
        ),
      ),
    );
  }
}

