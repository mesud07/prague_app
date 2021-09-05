import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:prague_app/model/top_attractions.dart';

class ListTopService {
  final _baseUrl = 'https://api2.praguecoolpass.com';
  final _endPointListUser = 'category';

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
      // final _listTopAttractions = List<TopAttractions>.from(_decodedBody.map((x) => TopAttractions.fromJson(x)));

      /// Response: Dart Object
      return _decodedBody;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}

Future<List> loadToursAndCruisesData() async {
  List posts = [];
  List filter = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/obhect/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    posts = json.decode(response.body);
    for (var i = 0; i < posts.length; i++) {
      if (posts[i]['categories'].isNotEmpty) {
        if (posts[i]['categories'][0] == "59f5f69a55b58747073c3e88")
          filter.add(posts[i]);
      }

    }

    print("Filter" + filter[1]['categories'][0].toString());
    return filter;


  } catch (err) {

    print(err);
  }

  return filter;
}
Future<List> loadCruisesData() async {
  List posts = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API = 'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    posts = json.decode(response.body);

    for (var i = 0; i < posts.length; i++) {
      if (posts[i]['categories'].isNotEmpty) {
        if (posts[i]['categories'][0] == "59f5f69a55b58747073c3e88") {
          // print("categori" + posts[i]['categories'].toString());
          filter.add(posts[i]);
        }
      }
    }

    return filter;
  } catch (err) {
    print(err);
  }

  return filter;
}
