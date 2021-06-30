import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequestHelper {
  static Future<Map<String,dynamic>> getRequestHelper(String url) async {
    var response = await http.get(url);
    Map<String,dynamic> responseData = jsonDecode(response.body);
    return responseData;
  }
}
