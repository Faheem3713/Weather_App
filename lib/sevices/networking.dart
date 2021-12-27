import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Networking {
  Future getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body);
    final id = decodedData['weather'][0]['id'];
    final temperature = decodedData['main']['temp'];
    final place = decodedData['sys']['name'];
    return decodedData;
  }

  Future getCity(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    final decoded = jsonDecode(response.body);
    return decoded;
  }
}
