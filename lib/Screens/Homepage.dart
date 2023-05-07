
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Service/dealerList.dart';
import '../Utils/app_baar.dart';
import 'DealerList Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../Bloc/Login_Bloc/LoginBloc.dart';
import '../../Bloc/Login_Bloc/LoginEvent.dart';
import '../../Bloc/Login_Bloc/LoginState.dart';
import '../../Utils/color_constants.dart';
import '../../Utils/decoration_constants.dart';

import '../Utils/color_constants.dart';
import '../Utils/text_page.dart';

class DealerList extends StatefulWidget {
  const DealerList({Key? key}) : super(key: key);

  @override
  State<DealerList> createState() => _DealerListState();
}

class _DealerListState extends State<DealerList> {
  final TextEditingController searchdealer = TextEditingController();
  GlobalService globalService = GlobalService();



  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 132, 134, 134),

      bottomNavigationBar: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DealerList()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 33.w,
                  height: 6.8.h,
                  color: ColorConstants.deppp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("Continue "),
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                )),

            InkWell(
                onTap: () {

                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 33.w,
                  height: 6.8.h,
                  color: ColorConstants.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("Continue "),
                      Icon(
                        Icons.list_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                )),

            InkWell(
                 onTap: () {

                 },
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 34.w,
                  height: 6.8.h,
                  color: ColorConstants.deppp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     // Text("Continue "),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ))


          ]),

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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: searchdealer,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              Expanded(
                  child: FutureBuilder(
                    future: globalService.DealerListapi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context,index){
                              return Shimmer.fromColors(
                                  baseColor:Colors.grey.shade700 ,
                                  highlightColor: Colors.grey.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(height: 10, width: 89, color: Colors.white,),
                                      )
                                    ],
                                  ));

                            });
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String dealer = snapshot.data![index]['name'];
                            String dealerid = snapshot.data![index]['dealerid'];

                            if (searchdealer.text.isEmpty) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text(snapshot.data![index]['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(dealerid :dealerid)));
                                      },
                                    ),
                                  )
                                ],
                              );
                            } else if (dealer.toLowerCase().contains(searchdealer.text.toLowerCase())) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text(snapshot.data![index]['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(dealerid :dealerid )));

                                      },
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
