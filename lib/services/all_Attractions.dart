import 'dart:convert';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:prague_app/model/top_attractions.dart';

class ListTopService {
  final _baseUrl = 'https://api2.praguecoolpass.com';
  final _endPointListUser = 'object/attraction/';

  Future<List> getListTop() async {

    final _url = Uri.parse('$_baseUrl/$_endPointListUser');

    final response = await http.get(_url);

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;
      print(response.body);

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody);

      /// JSON (List) To Dart (Object)
      final _listTopAttractions = List<TopAttractions>.from(_decodedBody.map((x) => TopAttractions.fromJson(x)));

      /// Response: Dart Object
      return _decodedBody;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}

Future<List<dynamic>> pragueCastleloadData() async {
  List allAttractions = [];
  List praguecastle = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    allAttractions = json.decode(response.body);
   return allAttractions;

  } catch (err) {
    print(err);
  }

  return allAttractions;
}



Future<List<dynamic>> favoritesData(List list) async {
  List allAttractions = [];
  List favorites = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    allAttractions = json.decode(response.body);
    for(var i=0;i<list.length;i++){
      for(var j in allAttractions){
        if (j['order']==list[i]){
          favorites.add(j);
        }

      }

    }
    print(favorites[1]['content']['en']['title']);
    return favorites;

  } catch (err) {
    print(err);
  }

  return favorites;
}

Future<List<Marker>> markersData() async {
  List allAttractions = [];
  List<Marker> markers = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    allAttractions = json.decode(response.body);
    for(var i=0;i<allAttractions.length;i++){
      markers.add(Marker(
        markerId: MarkerId("marker-"+i.toString()),
        position: LatLng(allAttractions[i]['lat'],allAttractions[i]['lon']),
      ));
    }
    return markers;

  } catch (err) {
    print(err);
  }

  return markers;
}
