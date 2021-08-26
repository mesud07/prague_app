import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prague_app/model/top_attractions.dart';
import 'package:prague_app/services/topAttractions_service.dart';

class Deneme1 extends StatefulWidget {
  Deneme1({Key? key}) : super(key: key);

  @override
  _Deneme1State createState() => _Deneme1State();
}

class _Deneme1State extends State<Deneme1> {

  /// Servis sınıfından bir nesne oluşturduk
  final _listTopService = ListTopService();

  ///[Future<List<User>>] tipinde [_future] isimli bir değişken oluştur.
  late Future<List<TopAttractions>> _futureListTop;

  @override
  void initState() {
    /// Sayfa yüklenmeden [getListUser] metodunu tetikleyip,
    /// Oluşturduğumuz [_futureListUser] değişkenini [getPost] metoduna atadık.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text(
          'List User Example',
        ),
      ),
      body: Container(

        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<TopAttractions>>(
          future: _futureListTop,
          builder: (BuildContext context, AsyncSnapshot<List<TopAttractions>> snapshot) {

            ///  API'den dönen yanıt [başarılı] ise ListView.builder widgeti yardımıyla ekranda göster.
            print(snapshot.data!.length);

            if (snapshot.hasData) {
              print("snapshot var");
              return ListView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  print(snapshot.data!.length);
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Text(
                        'Id: ${snapshot.data![index].id}',
                      ),
                      title: Text(
                        'Title: ${snapshot.data![index].id} ${snapshot.data![index].id}',
                      ),

                    ),
                  );
                },
              );

              ///  Eğer API'den hata dönerse hata mesajını Text widgetine ekranda göster.
            } else if (snapshot.hasError) {
              print("snapshot yok");

              return Text(

                '${snapshot.error}',
              );
            } else {
              ///  Veri tamamen gelene kadar [CircularProgressIndicator] göster.
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
