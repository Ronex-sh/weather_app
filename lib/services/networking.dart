import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class Network {
  final String url;

  Network(this.url);

  Future<dynamic> getDate() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
//      double temp = decodeData["main"]["temp"];
//      print(temp);
      return decodeData;
    } else {
      return response.statusCode;
    }
  }
}
