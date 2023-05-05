


import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_baar.dart';

class DealerDetails extends StatefulWidget {
  String dealerid;

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
      body: dealerProfile.isNotEmpty ?


          


      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(dealerProfile['logo']),
                maxRadius: 80,
              ),

            ),

            const Divider(
              color: Colors.black,
              height: 25,
              thickness: 2,
              indent: 10,
              endIndent: 5,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(dealerProfile['name'] ?? '', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),),
                  const SizedBox(height: 10,),
                  Text(dealerProfile['address'] ?? '',
                    style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10,),
                  Text(dealerProfile['city'] ?? '',
                    style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10,),
                  Text(dealerProfile['state'] ?? '',
                    style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10,),
                  Text(dealerProfile['direct'] ?? '',
                    style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const SizedBox(width: 30,),

                      InkWell(
                        onTap: () {
                          _launchPhoneURL(dealerProfile['direct']);
                        },
                        child: Container(
                            width: 15.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Icon(Icons.call, size: 30)),
                      ),
                      const SizedBox(width: 90,),

                      InkWell(
                        onTap: () async {
                          Uri sms = Uri.parse('sms:101022?body=your+text+here');
                          if (await launchUrl(sms)) {
                            //app opened
                          } else {
                            //app is not opened
                          }
                        },
                        child: Container(
                            width: 15.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Icon(Icons.message, size: 30)),
                      ),

                      const SizedBox(width: 90,),

                      InkWell(
                        onTap: () async {
                          String email = Uri.encodeComponent(dealerProfile['emailforapp'] );

                          //output: Hello%20Flutter
                          Uri mail = Uri.parse("mailto:$email");
                          if (await launchUrl(mail)) {
                            //email app opened
                          }else{
                            //email app is not opened
                          }
                        },
                        child: Container(
                            width: 15.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Icon(Icons.mail, size: 30)),
                      ),



                    ],
                  )
                ],
              ),
            ),

          ],
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




