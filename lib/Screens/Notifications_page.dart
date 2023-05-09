
// ignore_for_file: file_titles

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Service/dealerList.dart';
import '../Service/notifictionService.dart';
import '../Utils/app_baar.dart';
import 'DealerList Details.dart';
import 'Notifications_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final TextEditingController searchdealer = TextEditingController();
  notifictionService globalService = notifictionService();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(


      appBar: AppBar(
        title: Text('Dealer List'),
        actions: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {

            },
          )
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

              Expanded(
                  child: FutureBuilder(
                    future: globalService.notificationapi(),

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
                            String dealer = snapshot.data![index]['title'];
                            //tring id = snapshot.data![index]['id'];

                            if (searchdealer.text.isEmpty) {
                              return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(snapshot.data![index]['title'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                    // onTap: (){
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(id :id)));
                                    // },
                                  ),
                                )
                              ],
                              );
                            } else if (dealer.toLowerCase().contains(searchdealer.text.toLowerCase())) {
                              return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(snapshot.data![index]['title'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                //     onTap: (){
                                //       Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(id :id )));
                                // //
                                //     },
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
// List<IconData> listOfIcons = [
//   Icons.home_rounded,
//   Icons.list,
//   Icons.add_circle,
// ];
}
