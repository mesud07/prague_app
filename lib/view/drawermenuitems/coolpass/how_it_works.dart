import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/sizes_helper.dart';
import 'package:prague_app/model/slidermodel.dart';

class HowItWorks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              child: Text(''' PRAGUE COOLPASS & CARD
        You have two options how to get and use your Prague
        CoolPass. You can either download it in digital form to
        your mobile or collect the physical card upon arrival.
        PRAGUE COOLPASS - sent straight to your smartphone
        Prague CoolPass is the latest convenient tool for
        discovering Prague attractions on your own. It comes in
        the shape of a QR-code that can be purchased online or
        directly in this App. Download in seconds - and you're
        ready to go!''',style: GoogleFonts.ubuntu(fontSize: 12,color: Colors.black),),),
            SizedBox(height: 50,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(pageItemList[0].urlname)
                ),
              ),
            ),
            SizedBox(height: 50,),

            Text('''
          PRAGUE CARD - order online and collect upon arrival
        Prague Card is a classic sightseeing card, enjoyed by more
        than one million visitors since 1992. It is a smart card
        available for purchase online and further pickup at our
        collection points in Prague.''',style: GoogleFonts.ubuntu(fontSize: 14,color: Colors.black,),),

          ],
        ),
      ),
    );
  }
}
