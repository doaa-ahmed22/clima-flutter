import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorking {
  final String uri;

  NetWorking(this.uri);

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
