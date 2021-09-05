import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/services/faqService.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/faqmenu.dart';

class CancellationFaq extends StatefulWidget {
  @override
  _CancellationFaqState createState() => _CancellationFaqState();
}


class _CancellationFaqState extends State<CancellationFaq> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(

          children: [
            Container(width: 40),
            Text("Cancellation & Refund",style: GoogleFonts.ubuntu(color: Colors.black),)
          ]),),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
            future: cancellationRefundLoadData(),
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
                            title: Text(
                              snapshot.data![index]['content']['en']['text'],
                              style: TextStyle(fontWeight: FontWeight.w700),
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
