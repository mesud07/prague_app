import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:prague_app/model/faqmodel.dart';
import 'package:prague_app/model/top_attractions.dart';


Future<List<dynamic>> faqLoadData() async {
  List faq = [];
  List filter = [];
  List<FaqModel> object= [];

  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2d67b08d0539715a4e50") {
           print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}


Future<List<dynamic>> howToUseLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2da4b08d0539715a4e51") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}


Future<List<dynamic>> mobilePassLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5fbcc773a82b3d755a07606a") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
Future<List<dynamic>> attractionsFaqLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2dcab08d0539715a4e52") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
Future<List<dynamic>> transportLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5d1a4eabfb520e63b62f53f4") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
Future<List<dynamic>> purchaseLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2e2fb08d0539715a4e54") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
Future<List<dynamic>> cancellationRefundLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2e50b08d0539715a4e55") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
Future<List<dynamic>> otherLoadData() async {
  List faq = [];
  List filter = [];
  try {
    // This is an open REST API endpoint for testing purposes
    const API =
        'https://api2.praguecoolpass.com/faq/';
    final http.Response response = await http.get(Uri.parse(API));
    faq = json.decode(response.body);
    for (var i = 0; i < faq.length; i++) {
      if (faq[i]['category'].isNotEmpty) {
        if (faq[i]['category']=="5cfb2e66b08d0539715a4e56") {
          print("categori" + faq[i]['category'].toString());
          filter.add(faq[i]);

        }
      }
    }
    return filter;

  } catch (err) {
    print(err);
  }

  return filter;
}
