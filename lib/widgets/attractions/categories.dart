import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/services/attractions_page/category_service.dart';
import 'package:prague_app/services/topAttractions_service.dart';
class Categories extends StatefulWidget{
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _favoriteActivate = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150,
      child: FutureBuilder(
          future: loadCategoryData(),

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

                      },
                      child: Container(

                        width: 200,

                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data![index]['image'])),
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