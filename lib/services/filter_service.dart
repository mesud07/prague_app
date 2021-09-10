import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert'
;
Future<List> loadAreaFilterData(String type,String gelen) async {
  List AttractionsOfContent = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    AttractionsOfContent = json.decode(response.body);
if(type=="area"){
  for (var i = 0; i < AttractionsOfContent.length; i++) {
    if (AttractionsOfContent[i]['area'].isNotEmpty) {
      if (AttractionsOfContent[i]['area'] == gelen) {
        debugPrint("area lar : "+AttractionsOfContent[i]['area']);
        filter.add(AttractionsOfContent[i]);
      }
    }
  }

}else{
  for (var i = 0; i < AttractionsOfContent.length; i++){
  if (AttractionsOfContent[i]['categories'].isNotEmpty) {
    if (AttractionsOfContent[i]['categories'][0] == gelen) {
      debugPrint("Kategoriler : "+AttractionsOfContent[i]['categories'][0]);
      filter.add(AttractionsOfContent[i]);
    }
  }
  }
}


    return filter;
  } catch (err) {
    print(err);
  }

  return filter;
}

