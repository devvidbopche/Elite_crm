import 'dart:convert';
import 'package:http/http.dart' as http;



class GlobalService{

Future<List<dynamic>> DealerListapi() async{
  dynamic data;
  final response = await http.get(Uri.parse("https://elite-dealers.com/api/dealerslistall.php"));

  if(response.statusCode == 200){
    data = jsonDecode(response.body)['messages'];
    return data;
  }else{
    throw Exception('Error');
  }
}
}

