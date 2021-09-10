import 'dart:convert';
import 'package:http/http.dart' as http;
Future<dynamic> detailLoadData(int order) async {
  List allattractions = [];
  var selectedObject;
  try {
    print("servisteki "+order.toString());
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/object/attraction/';
    final http.Response response = await http.get(Uri.parse(API));
    allattractions =  json.decode(response.body);
    if(allattractions.isNotEmpty){
    for(var i =0;i<allattractions.length;i++){


      if(allattractions[i]["order"]==order){
        print("dolu");
        selectedObject=allattractions[i];
        break;
      }

    }}else{
      print("data yok");
    }
    return selectedObject;
  } catch (err) {
    print(err);
  }

}