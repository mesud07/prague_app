

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/services/all_Attractions.dart';
import 'package:prague_app/utils/box_manager.dart';
import 'package:prague_app/utils/widgets/appbar.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {



  @override
  Widget build(BuildContext context) {
    Box _cagirmakicin=Hive.box("favoriListesi");
    List idler=_cagirmakicin.keys.toList();
    debugPrint("yeni liste "+ idler.toString());

    // debugPrint("Uzunluk "+favoriler.length.toString());
    // debugPrint(favoriler[3]);
    //debugPrint(_cagirmakicin.getAt(listIndex).toString());
    //debugPrint("degerler" +_cagirmakicin.values.toString());
    //debugPrint("keyler "+ _cagirmakicin.keys.toString());
   // var o_ismin_indexi = _cagirmakicin.keyAt(listIndex);
    //return Text(_cagirmakicin.getAt(listIndex).toString());

    return Scaffold(
      appBar: header(context, "attractions"),
      bottomNavigationBar: MyBottomApp(context, "attractions"),
      drawer: NavigationDrawerWidget(),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ValueListenableBuilder(
          valueListenable: _cagirmakicin.listenable(),
          builder: (context, Box box, _) {

            return FutureBuilder<List>(
              future: favoritesData(idler),
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
                        var isim = _cagirmakicin.getAt(index).toString();

                        int order = snapshot.data![index]['order'];
                       // String isim = snapshot.data![index]['content']['en']['title'];

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
                                          IconButton(onPressed: ()=>onFavoritePress(isim, box, order), icon: getIcon(order, box),color: Colors.white,)
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
            );
          },
        ),
      ),

    );
  }
  Widget getIcon(int index,var a) {
    if (a.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.white);
    }
    return Icon(Icons.favorite_border);
  }
  void onFavoritePress(var isim,var a,var o_ismin_indexi) {
    // isim = _cagirmakicin.getAt(listIndex).toString();
    // o_ismin_indexi = _cagirmakicin.keyAt(listIndex);
    for(var i in a.values){

      if(isim==i){
        setState(() {
          a.delete(o_ismin_indexi);

        });
      }}}

}

