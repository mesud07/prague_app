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

Future<List> loadPragueAreasData() async {
  List pragueAreas = [];
  List pragueAreass = [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/area';
    final http.Response response = await http.get(Uri.parse(API));
    pragueAreas = json.decode(response.body);
    pragueAreas.sort((m1, m2) {

      return m1['order'].compareTo(m2["order"]);
    });
  } catch (err) {
    print(err);
  }

  return pragueAreas;
}
