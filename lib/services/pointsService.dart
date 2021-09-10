import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';


Future<List<dynamic>> loadPointsData() async {
  List points = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/point';
    final http.Response response = await http.get(Uri.parse(API));
    points = json.decode(response.body);
    return points;

  } catch (err) {
    print(err);
  }

  return points;
}
