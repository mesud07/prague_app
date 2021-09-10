import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/services/filter_service.dart';
import 'package:prague_app/services/topAttractions_service.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:prague_app/widgets/homepage_button.dart';
import 'package:http/http.dart' as http;



class FilteredPage extends StatefulWidget {
  final String filtertype;
  final String filterId;
  FilteredPage(this.filtertype,this.filterId);

  @override
  _FilteredPageState createState() => _FilteredPageState();
}
class _FilteredPageState extends State<FilteredPage> {
bool _favoriteActivate=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: header(context,"attractions"),
      bottomNavigationBar: MyBottomApp(context, "attractions"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
            child:Column(
              children: [
                Container(
                  child: FutureBuilder<List>(
                    future: loadAreaFilterData(widget.filtertype,widget.filterId),
                    builder: (BuildContext context,AsyncSnapshot<List> snapshot){
                      if(snapshot.data!=null){
                        //debugPrint(snapshot.data![0]['content']['en']['title']);
                      }else{
                        debugPrint("boş");
                      }
                      if(snapshot.hasData){
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              int order = snapshot.data![index]['order'];

                              //  debugPrint(snapshot.data![index]['content']['en']['title']);

                              return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, "/detailpage/$order");
                                },
                                child: Container(
                                  height: 200,

                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
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
                                            child: Text(snapshot.data![index]['content']['en']['title'],
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 16, color: Colors.white),
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

                      }else if(snapshot.hasError){
                        return Text(snapshot.hasError.toString());
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }

                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

