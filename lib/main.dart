import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/model/slidermodel.dart';
import 'package:prague_app/view/attractions_page.dart';
import 'package:prague_app/view/deneme1.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/prague_coolpass_card.dart';
import 'package:prague_app/view/homepage.dart';
import 'package:prague_app/widgets/widgets.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Prague App',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
        primaryIconTheme: IconThemeData(color: Colors.black)
      ),
      home: AttractionsPage(),

    );
  }
}

class SliderPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionPages(),
      bottomNavigationBar: BottomAppBar(

        color: Colors.deepOrange,
        elevation: 70,
        child: Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                }, child: Text("Get Started",style: GoogleFonts.cinzel(fontSize: 20,color: Colors.white),)),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
