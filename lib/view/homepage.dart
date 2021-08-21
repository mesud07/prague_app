import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/model/slidermodel.dart';
import 'package:prague_app/widgets/homepage_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _favoriteActivate=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40,
        elevation: 30,
        title: Center(
          child: Text(
            "PRAGUE CoolPass",
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
      ),
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
                      Homepage_Button("MY COOLPASS", Icons.smartphone),
                      Homepage_Button("ATTRACTIONS", Icons.attractions),
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
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pageItemList.length,
                  itemBuilder: (context, index) {
                    return InkWell(

                      onTap: (){

                      },
                      child: Container(
                        height: 200,

                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(pageItemList[index].urlname),
                            fit: BoxFit.cover,
                          ),
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
                            Container(
                              padding: EdgeInsets.all(4),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                pageItemList[index].title,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width /2 +100,
              margin: EdgeInsets.all(10),
              height: 50,
              child: RaisedButton(color: Colors.orange
                ,onPressed: (){},child: Text("Show The Attractions",style: GoogleFonts.ubuntu(fontSize: 20),),),
            )
          ],
        ),
      ),
    );
  }
}
