// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class DataDetails{
//
//
//
//
//
//   Future<List<dynamic>> DealerDetailsdata(String? dealerid) async{
//     var body = {"dealerid": dealerid};
//
//     var formData = FormData.fromMap(body);
//     var response = await Dio().post('https://elite-dealers.com/api/dealersprofil.php?dealerid=$dealerid', data: formData);
//
//     if(response.statusCode == 200){
//       print(response.toString());
//       return response.data;
//     }else{
//       throw Exception('Error');
//     }
//   }
// }
