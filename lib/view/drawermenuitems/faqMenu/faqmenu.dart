import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
class FaqMenu extends StatefulWidget {

  @override
  _FaqMenuState createState() => _FaqMenuState();
}

List<String> titles = [
"About & Benefits",
"How to Use",
"Mobile Pass",
"Attractions",
"Transport",
"Purchase",
"Cancellation & Refund",
"Other",
];
List<String> urls = [
  "/faq/aboutbenefits",
  "/faq/howtouse",
  "/faq/mobilepass",
  "/faq/attractions",
  "/faq/transport",
  "/faq/purchase",
  "/faq/cancellation_refund",
  "/faq/other",
];
class _FaqMenuState extends State<FaqMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: header(context,"faq"),
      bottomNavigationBar: MyBottomApp(context,"faq"),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, urls[index]);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
            height: MediaQuery.of(context).size.height /14,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      margin: EdgeInsets.only(top: 3),
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: Text(titles[index],style: GoogleFonts.rubik(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        );
      }),
    );
  }
}
