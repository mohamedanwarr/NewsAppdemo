import 'package:http/http.dart'as http;
import 'dart:convert';

import '../model/busness.dart';

class networkapi{
   static Future <business> fetchbusiness({required String URL}) async {

    final response= await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      return business.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception("SOMETHING WRONG");
    }
  }
}



