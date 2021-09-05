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

import 'homepage.dart';
class AttractionsPage extends StatefulWidget {

  @override
  _AttractionsPageState createState() => _AttractionsPageState();
}

class _AttractionsPageState extends State<AttractionsPage> {

  bool _favoriteActivate =false ;
  String text="Attractions";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

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


        );
  }
}
