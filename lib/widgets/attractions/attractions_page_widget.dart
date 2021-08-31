import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/services/topAttractions_service.dart';
class MostPopularWidget extends StatefulWidget{
  @override
  _MostPopularWidgetState createState() => _MostPopularWidgetState();
}

class _MostPopularWidgetState extends State<MostPopularWidget> {
bool _favoriteActivate = false;
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return             Container(
      height: 150,
      child: FutureBuilder(
          future: loadData(),

          builder:(BuildContext context,AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    // debugPrint(snapshot.data![index]['content']['en']['title']);

                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/detailpage");

                      },
                      child: Container(

                        width: 200,

                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data![index]['webimages'][0])),
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
                                  child: Text(snapshot.data![index]['content']['en']['title'],maxLines: 1,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 12, color: Colors.white),
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