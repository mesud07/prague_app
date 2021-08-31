import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/sizes_helper.dart';
import 'package:prague_app/services/topAttractions_service.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:prague_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:prague_app/widgets/attractions/attractions_page_widget.dart';
import 'package:prague_app/widgets/attractions/categories.dart';
import 'package:prague_app/widgets/attractions/prague_districts.dart';
import 'package:prague_app/widgets/attractions/tours_cruises.dart';
class AttractionsPage extends StatefulWidget {

  @override
  _AttractionsPageState createState() => _AttractionsPageState();
}

class _AttractionsPageState extends State<AttractionsPage> {
  bool _favoriteActivate =false ;
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
              "Attractions",
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ),
      drawer: NavigationDrawerWidget(),
      bottomNavigationBar: BottomNavigation_Bar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(

              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outlined,),),
                  Container(

                    alignment: Alignment.center,
                    height: 100,
                    width: 220,

                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton.icon(icon: Icon(Icons.location_on,color: Colors.black,),label: Text("Map",style: TextStyle(color: Colors.black),),onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white), ),),
                        Divider(height: 100,indent: 2.0,color: Colors.black,),
                        ElevatedButton.icon(icon: Icon(Icons.filter_list,color: Colors.black,),label: Text("Filter",style: TextStyle(color: Colors.black)),onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),),)


                      ],
                    ),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search)),

                ],
              ),
            ),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.all(4),
              alignment:Alignment.topLeft,child: Text(
              "Most Popular",style: GoogleFonts.rubik(fontSize: 25,letterSpacing: 2),
            ),),

            MostPopularWidget(),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(4),
              alignment:Alignment.topLeft,child: Text(
              "PRAGUE DISTRICTS",style: GoogleFonts.rubik(fontSize: 20,letterSpacing: 2),
            ),),
            Prague_Districts(),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(4),
              alignment:Alignment.topLeft,child: Text(
              "CATEGORIES",style: GoogleFonts.rubik(fontSize: 20,letterSpacing: 2),
            ),),
            Categories(),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(4),
              alignment:Alignment.topLeft,child: Text(
              "TOURS & CRUISES",style: GoogleFonts.rubik(fontSize: 20,letterSpacing: 1),
            ),),
            Tours_Cruises(),
            SizedBox(height: 20,),



          ],
        ),


      ),
    );
  }
}
