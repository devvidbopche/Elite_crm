// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;



class notifictionService{

  Future<List<dynamic>> notificationapi() async{
    dynamic data;
    final response = await http.get(Uri.parse("https://elite-dealers.com/api/notifi_list.php"));

    if(response.statusCode == 200){
      data = jsonDecode(response.body)['messages'];
      return data;
    }else{
      throw Exception('Error');
    }
  }
}

