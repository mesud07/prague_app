import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/model/slidermodel.dart';
import 'package:prague_app/model/top_attractions.dart';
import 'package:prague_app/services/topAttractions_service.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/prague_coolpass_card.dart';
import 'package:prague_app/widgets/homepage_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:prague_app/helper/sizes_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //service elemanı oluşturdum.get

  bool _favoriteActivate=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(

              color: Colors.black,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 40,
        elevation: 30,
        title: Container(
          alignment: Alignment.center,
          color: Colors.white,
          width: displayWidth(context)*0.65,
          child: Text(
            "Prague CoolPass",
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
      ),

      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Homepage_Button("MY COOLPASS", Icons.smartphone,),
                      Homepage_Button("ATTRACTIONS", Icons.attractions,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Homepage_Button("TIPS & ALERRTS", Icons.warning_outlined),
                      Homepage_Button("BUY COOLPASS", Icons.credit_card),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                "MOST POPULAR",
                style: GoogleFonts.rubik(fontSize: 20),
              ),
            ),
            Container(
              child: FutureBuilder<List>(
                future: loadData(),
                builder: (BuildContext context,AsyncSnapshot<List> snapshot){
                  if(snapshot.data!=null){
                    debugPrint(snapshot.data![0]['content']['en']['title']);
                  }else{
                    debugPrint("boş");
                  }
                  if(snapshot.hasData){
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          debugPrint(snapshot.data![index]['content']['en']['title']);

                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/detailpage");
                            },
                            child: Container(
                              height: 200,

                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data![index]['webimages'][0])),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [


                                      Container(
                                        padding: EdgeInsets.all(2),

                                        color: Colors.orangeAccent,
                                        child: Text("INCLUDED"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.attractions,
                                              color: Colors.white,
                                              size: 30.0,
                                              semanticLabel:
                                              'Text to announce in accessibility modes',
                                            ),
                                            IconButton(onPressed: (){
                                              setState(() {
                                                _favoriteActivate ? _favoriteActivate = false : _favoriteActivate = true;
                                                print(_favoriteActivate);

                                              });
                                            }, icon: _favoriteActivate? Icon(Icons.favorite_outlined,color: Colors.white,) : Icon(Icons.favorite_border,color: Colors.white,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Opacity(
                                        opacity:0.5,
                                        child: Container(
                                          height: 25,
                                          color: Colors.black,
                                          padding: EdgeInsets.all(4),
                                          alignment: Alignment.bottomLeft,
                                        ),
                                      ),


                                      //****************
                                      //ÇEKTİĞİM  VERİ

                                      Container(
                                        margin: EdgeInsets.all(4),
                                        child: Text(snapshot.data![index]['content']['en']['title'],
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 16, color: Colors.white),
                                        ),
                                      ),
                                      //ÇEKEMEDİĞİM VERİ
                                     // Text(snapshot.data![index].content.en.title),

                                    ],
                                  ),

                                ],
                              ),
                            ),
                          );
                        });

                  }else if(snapshot.hasError){
                    return Text(snapshot.hasError.toString());
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }

                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width /2 +100,
              margin: EdgeInsets.all(10),
              height: 50,
              child: RaisedButton(color: Colors.orange
                ,onPressed: (){Navigator.pushNamed(context, '/attractions');},child: Text("Show The Attractions",style: GoogleFonts.ubuntu(fontSize: 20),),),
            )
          ],
        ),
      ),
    );
  }
}

VoidCallback? git(BuildContext context) {
  Navigator.pushNamed(context, "/attractions");
}
