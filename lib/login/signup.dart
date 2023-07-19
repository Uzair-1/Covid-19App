import 'package:apitutorial/CovidApp/HomeScreen.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: [
                const SizedBox(height: 30,),
                const Center(
                    child: Text("Sign Up",
                      style: TextStyle(fontSize: 24, color: Colors.white,),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: " Konfirmation Password",
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
                const SizedBox(height: 120,),
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
                        child: Text(" Sign Up ",style: TextStyle(fontSize: 20,color: Colors.white),)
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}