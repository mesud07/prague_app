import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:prague_app/helper/datahelper.dart';

import 'package:prague_app/services/all_Attractions.dart';
import 'package:prague_app/utils/widgets/appbar.dart';

import 'detailPage.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  List<dynamic> allattractions = [];
  void getir()async{
    //listeye dönüştürdük
    allattractions= await pragueCastleloadData().then((value)=>allattractions=value);
    debugPrint(allattractions[1].toString());
    _foundPlaces = allattractions;
    setState(() {

    });
  }



  // This list holds the data for the list view
  List<dynamic> _foundPlaces = [];
  @override
  initState() {
    // at the beginning, all users are shown
      getir();

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allattractions;
    } else {
      results = allattractions
          .where((place) =>
          place["content"]['en']['title'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundPlaces = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    Box _cagirmakicin=Hive.box("favoriListesi");
    debugPrint("bulunanların uzunluğu"+_foundPlaces.length.toString());

    return Scaffold(
      appBar: header(context, "attractions1"),
      bottomNavigationBar: MyBottomApp(context, "attractions"),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),

          ValueListenableBuilder(

            valueListenable: Hive.box("favoriListesi").listenable(),
            builder: (context,box,_){
                return Expanded(
                    child: _foundPlaces.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                    itemCount: _foundPlaces.length,
                    itemBuilder: (context, index) {
                      //int order = 1;
                      int order = _foundPlaces[index]['order'];
                      debugPrint(_foundPlaces[index]['content']['en']['title']+ " order : "+ _foundPlaces[index]['order'].toString());
                     var isim = _foundPlaces[index]['content']['en']['title'];
                      // var isim = _cagirmakicin.getAt(index).toString();
                      //var isim = "PRAGUE CASTLE CIRCUIT";
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
                                image: NetworkImage("https://static2.praguecoolpass.com/"+_foundPlaces[index]['webimages'][0])),
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
                                        IconButton(onPressed: ()=>onFavoritePress(order, box, isim), icon: getIcon(order, box),color: Colors.white,)
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
                                    child: Text(_foundPlaces[index]['content']['en']['title'],
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
                    },
                  ): Center(child:CircularProgressIndicator()));
                    },
                  )
          ],
        ),
      ),
    );
  }
}