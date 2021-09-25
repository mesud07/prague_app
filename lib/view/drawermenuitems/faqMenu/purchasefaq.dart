import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/services/faqService.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/faqmenu.dart';

class PurchaseFaq extends StatefulWidget {
  @override
  _PurchaseFaqState createState() => _PurchaseFaqState();
}


class _PurchaseFaqState extends State<PurchaseFaq> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(

          children: [
            Container(width: 40),
            Text("Purchase",style: GoogleFonts.ubuntu(color: Colors.black),)
          ]),),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
            future: purchaseLoadData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){

                      return ExpansionTile(title: Text(
                          snapshot.data![index]['content']['en']['title']

                      ),
                        children: [
                          ListTile(
                            title: Html(
                              data: snapshot.data![index]['content']['en']['text'],
                              style: {
                                "body": Style(
                                  fontSize: FontSize(16.0),

                                ),
                              },
                            ),
                          )
                        ],);
                    });
              }else if(snapshot.hasError){
                return Text("Problem");
              }else{
                return Center(child: CircularProgressIndicator(),);
              }

            }),
      ),
    );
  }
}
