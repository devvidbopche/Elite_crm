import 'package:flutter/material.dart';


import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_baar.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack Demo',
      home: new ProfileUI2(),
    );
  }
}


class ProfileUI2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(

            children: [


              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "add you image URL here "
                        ),
                        fit: BoxFit.cover
                    )
                ),

                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "Add you profile DP image URL here "
                      ),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 100,
              ),
              Text(
                "BOB HOWARD PDC - ACURA"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.black,
                  letterSpacing: 2.0,

                  fontWeight: FontWeight.w800
              ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Oklahoma City"
                ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,

                  fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "(405) 525-4422"
                ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600
              ),
              ),







              SizedBox(
                height: 50,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  ElevatedButton.icon(
                    onPressed: (){
                      print("You pressed Icon Elevated Button");
                    },
                    icon: Icon(Icons.call),  //icon data for elevated button
                    label: Text(""), //label text
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent //elevated btton background color
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      print("You pressed Icon Elevated Button");
                    },
                    icon: Icon(Icons.call),  //icon data for elevated button
                    label: Text(""), //label text
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent //elevated btton background color
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: (){
                      print("You pressed Icon Elevated Button");
                    },
                    icon: Icon(Icons.call),  //icon data for elevated button
                    label: Text(""), //label text
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent //elevated btton background color
                    ),
                  ),
                ],
              )
            ],


          ),




        )
    );
  }
}