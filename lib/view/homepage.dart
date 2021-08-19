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
      body: Container(
        color: Colors.white30,
        child: Column(
          children: [
            Expanded(

                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 5,left: 5,right: 5),
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
                )
            ),
            Container(
              padding: EdgeInsets.only(left: 12),

              alignment: Alignment.centerLeft,
              child: Text("MOST POPULAR",style: GoogleFonts.rubik(fontSize: 20),),
            ),
            Expanded(
              flex: 1,
             child: ListView.builder(
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: pageItemList.length,
                 itemBuilder: (context,index){
               return Container(
                 height: 200,
                 padding: EdgeInsets.all(10),
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(pageItemList[index].urlname),
                     fit: BoxFit.cover,
                   ),
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [

                     Container(
                         padding: EdgeInsets.only(left: 10),
                         alignment: Alignment.centerLeft,
                         child: Text(
                           pageItemList[index].title,
                           style:
                           GoogleFonts.ubuntu(fontSize: 26, color: Colors.white),
                         )),





                   ],
                 ),
               );
             }),
            )
          ],
        ),
      ),
    );
  }
}
