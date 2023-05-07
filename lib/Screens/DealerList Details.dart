


import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_baar.dart';
import 'Homepage.dart';

class DealerDetails extends StatefulWidget {
  String dealerid;
  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  DealerDetails({super.key, required this.dealerid});

  @override
  State<DealerDetails> createState() => _DealerDetailsState();
}


class _DealerDetailsState extends State<DealerDetails> {
  Map<String, dynamic> dealerProfile = {};

  Future<void> _getDealerProfile(String? dealerid) async {
    var body = {"dealerid": dealerid};

    var formData = FormData.fromMap(body);
    var response = await Dio().post(
        'https://elite-dealers.com/api/dealersprofil.php?dealerid=$dealerid',
        data: formData);

    if (response.statusCode == 200) {
      final responseString = response.data is String
          ? response.data
          : jsonEncode(response.data);
      final Map<String, dynamic> responseBody = json.decode(responseString);

      setState(() {
        dealerProfile = responseBody;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getDealerProfile(widget.dealerid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Color.fromARGB(255, 132, 134, 134),

      appBar: AppBar(
        title: Text('Dealer List'),
        actions: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 213, 85, 40),


      ),
      drawer: show(),
      body: dealerProfile.isNotEmpty
          ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(

            children: [


              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1557682260-96773eb01377?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=829&q=80"
                        ),
                        fit: BoxFit.cover
                    )
                ),

                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,4.8),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(dealerProfile['logo']),
                      radius: 80.0,
                    ),
                  ),
                ),
              ),




              SizedBox(
                height: 100,
              ),
              Text(
                dealerProfile['name'] ?? ''
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.black,
                  letterSpacing: 2.0,

                  fontWeight: FontWeight.w800
              ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                dealerProfile['address'] ?? ''
                ,style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color:Colors.black,

                  fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                dealerProfile['city'] ?? ''
                ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600
              ),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                dealerProfile['state'] ?? ''
                ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600
              ),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                dealerProfile['direct'] ?? ''
                ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black,
                  fontStyle: FontStyle.italic,                  fontWeight: FontWeight.w600
              ),
              ),



              SizedBox(
                height: 50,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  ///  call  buttton
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.0 , 0.5, 1.0],
                              colors: [Colors.white, Colors.white, Colors.blueGrey]
                          )
                      ),
                      child: RawMaterialButton(
                        onPressed: () async {
                          _launchPhoneURL(dealerProfile['direct']);
                        },
                        child: new Icon(
                          Icons.call,
                          color: Colors.grey[600],
                          size: 28.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(18.0),
                      )
                  ),

                  ///  call end buttton

                  ///  gmail_buttton
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.0 , 0.5, 1.0],
                              colors: [Colors.white, Colors.white, Colors.blueGrey]
                          )
                      ),
                      child: RawMaterialButton(
                        onPressed: () async {
                          String email = Uri.encodeComponent(dealerProfile['emailforapp'] );

                          //output: Hello%20Flutter
                          Uri mail = Uri.parse("mailto:$email");
                          if (await launchUrl(mail)) {
                            //email app opened
                          }else{
                            //email app is not opened
                          }
                        },
                        child: new Icon(
                          Icons.mail,
                          color: Colors.grey[600],
                          size: 28.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(18.0),
                      )
                  ),


                  ///  gmail_buttton




                  /// messaaages buttton
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.0 , 0.5, 1.0],
                              colors: [Colors.white, Colors.white, Colors.blueGrey]
                          )
                      ),
                      child: RawMaterialButton(
                        onPressed: () async {
                          Uri sms = Uri.parse(dealerProfile['direct']);
                          if (await launchUrl(sms)) {
                            //app opened
                          } else {
                            //app is not opened
                          }
                        },
                        child: new Icon(
                          Icons.message,
                          color: Colors.grey[600],
                          size: 28.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(18.0),
                      )
                  ),


                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DealerList()),
                  );
                },

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side:
                        const BorderSide(width: 7, color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)),
                    primary: Colors.deepOrangeAccent,
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 120)),
                child: const Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}




