import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/services/all_Attractions.dart';
import 'package:prague_app/services/attractions_page/prague_areas.dart';
import 'package:prague_app/services/topAttractions_service.dart';
class Prague_Districts extends StatefulWidget{
  @override
  _Prague_DistrictsState createState() => _Prague_DistrictsState();
}
class _Prague_DistrictsState extends State<Prague_Districts> {
  bool _favoriteActivate = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150,
      child: FutureBuilder(
          future: loadPragueAreasData(),

          builder:(BuildContext context,AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // debugPrint(snapshot.data![index]['order']);
                    var _id = snapshot.data![index]["_id"];
                   // debugPrint(_id);

                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,"/filteredPage/$_id");
                      },
                      child: Container(

                        width: 200,

                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data![index]['images'][0])),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
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
                                  child: FutureBuilder(
                                    future: pragueCastleloadData(),
                                    builder: (BuildContext context,AsyncSnapshot snapshota){
                                      return Text(snapshot.data![index]['content']['en']['title'],maxLines: 1,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12, color: Colors.white),
                                      );
                                    },
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

            }
            else if(snapshot.hasError){
              return Text("Bir problem oluştu");

            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}