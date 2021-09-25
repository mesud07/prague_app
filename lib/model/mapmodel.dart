
import 'dart:convert';

List<MapModel> faqFromJson(String str) =>
    List<MapModel>.from(json.decode(str).map((x) => MapModel.fromJson(x)));
class MapModel {
   final double lat,lon;
   MapModel({required this.lat,required this.lon});
  factory MapModel.fromJson(Map<String, dynamic> json)=> MapModel(

    //markerId:json['markerId'],
    lat: json['lat'],
    lon: json['lon'],
  );}