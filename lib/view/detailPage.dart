import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/dbhelper/databaseHelper.dart';
import 'package:prague_app/mapsample.dart';
import 'package:prague_app/services/detailService.dart';
import 'package:prague_app/services/topAttractions_service.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailPage extends StatefulWidget {
int order;
DetailPage(this.order);
  @override
  _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  bool aktif=true;
  late double lat,lon;
  var mySharedPrefences;
  late Future loaded_Data;


  String data = """<table>
  <caption>a test table with merged cells</caption>
  <thead>
    <tr>
      <th rowspan="2"></th>
      <th colspan="2">NORMAL PRICE</th>
      <th rowspan="2">price with CoolPass</th>
    </tr>
    <tr>
      <th>Adult</th>
      <th>Child</th>
      <th>Student</th>

    </tr>
  </thead>
  <tbody>
    <tr>
      <td>males</td>
      <td>1.9</td>
      <td>0.003</td>
      <td>40%</td>
    </tr>
    <tr>
      <td>females</td>
      <td>1.7</td>
      <td>0.002</td>
      <td>43%</td>
    </tr>
  </tbody>
</table>""";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaded_Data=detailLoadData(widget.order);
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40,

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Container(
              child: ValueListenableBuilder(
                valueListenable: Hive.box("favoriListesi").listenable(),
                builder: (context,box,_){
                  return FutureBuilder(
                    future: loaded_Data,
                    builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){

                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Container(
                            height: 600,
                            child: Center(child: CircularProgressIndicator(),));

                      }else if(snapshot.hasData){


                        //Yıldızlar

                        var yuvarlanacaksayi=snapshot.data!["reviewValue"];

                        String text =snapshot.data!['content']['en']['text'];
                        String isim =snapshot.data!['content']['en']['title'];


                        List<Widget> children = [];

                        for(var i=0;i<yuvarlanacaksayi;i++){
                          children.add(Icon(Icons.star));
                        }
                        num kalan=5-yuvarlanacaksayi;
                        for(var j=0;j<kalan;j++){
                          children.add(Icon(Icons.star_border_outlined));
                        }



                        lat=snapshot.data!["lat"];
                        lon=snapshot.data!["lon"];

                        return ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    height: 200,

                                    margin: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data!['webimages'][0])),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [



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
                                                  IconButton(onPressed: ()=>onFavoritePress(widget.order,box,isim), icon: getIcon(widget.order,box),color: Colors.white,)
                                                    //Icon(Icons.favorite_border,color: Colors.white,)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.orange,
                                  height: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.bottomLeft,
                                    child: Text("INCLUDED in Prgue Card",style: GoogleFonts.ubuntu(fontSize: 15,fontWeight: FontWeight.bold),),

                                  ),

                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Divider(height: 20,color: Colors.grey,thickness: 1,indent: 15,endIndent: 15,)),
                                ExpansionTile(title: Text("see more"
                                ),
                                  children: [
                                    Html(data: text),
                                  ],),
                                Container(
                                    margin: EdgeInsets.only(),
                                    child: Divider(height: 20,color: Colors.grey,thickness: 1,indent: 15,endIndent: 15,)),

                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width /6,
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            snapshot.data!['reviewValue']==5 ? "5.0" :
                                            snapshot.data!['reviewValue']==4 ? "4.0" :
                                            snapshot.data!['reviewValue']==3 ? "3.0" :
                                            snapshot.data!['reviewValue']==2 ? "2.0" :
                                            snapshot.data!['reviewValue']==1 ? "1.0":
                                            snapshot.data!['reviewValue']==0 ? "0.0":
                                            snapshot.data!['reviewValue'].toString(),
                                            style: GoogleFonts.rubik(fontSize: 30,fontWeight: FontWeight.bold),)),
                                      Column(
                                        children: [Container(
                                          height: 25,
                                          width: MediaQuery.of(context).size.width /3,
                                          alignment: Alignment.topCenter,
                                          child:Row(children:children,),
                                        ),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              height: 25,
                                              width: MediaQuery.of(context).size.width/6,
                                              child: Text(snapshot.data!['reviewValue'].round().toString()+" review"))],

                                      )
                                    ],

                                  ),
                                ),

                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Divider(height: 20,color: Colors.grey,thickness: 1,indent: 15,endIndent: 15,)),
                                ExpansionTile(
                                  title: Text("PRICE & BENEFITS"
                                  ),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      margin:EdgeInsets.all(20),

                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(20),


                                      ),
                                      child: Center(child: Text("INCLUDED in Prague Card",style: GoogleFonts.ubuntu(color: Colors.black,fontWeight: FontWeight.bold),)),
                                    ),
                                    Container(
                                        margin:EdgeInsets.all(10),
                                        padding:EdgeInsets.all(10),

                                        child: Html(data: data))
                                  ],),
                                Container(

                                    margin: EdgeInsets.only(),
                                    child: Divider(height: 20,color: Colors.grey,thickness: 1,indent: 15,endIndent: 15,)),

                                Container(
                                  color: Colors.grey.shade400,
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width /4,
                                          child: IconButton(onPressed: (){}, icon: Icon(Icons.directions,size:25,color: Colors.black,))),
                                      Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width /4,
                                          child: IconButton(onPressed:()=>launch("tel://${snapshot.data!['phone']}"),
                                              icon: Icon(Icons.smartphone,size:25,color: Colors.black,))),
                                      Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width /4,
                                          child: IconButton(onPressed: ()=>_launchURL(),
                                              icon: Icon(Icons.public,size:25,color: Colors.black,))),
                                      Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width /4,
                                          child: IconButton(onPressed: (){}, icon: Icon(Icons.mail,size:25,color: Colors.black,))),

                                    ],
                                  ),
                                ),
                                InkWell(

                                  child: Container(
                                      width: 400,
                                      height: 250,
                                      child: MapSample(lat, lon)),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 2),
                                  color: Colors.white12,
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,

                                ),
                              ],
                            ),

                          ],
                        );
                      }else{
                        return Text("bir hata oluştu");
                      }
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void onFavoritePress(int order, var a,String isim) {
  if (a!.containsKey(order)) {
    a.delete(order);
    debugPrint(a.values.length.toString());
  } else {
    a.put(order,isim);
  }
}
Widget getIcon(int order, var a) {
  if (a.containsKey(order)) {
    return Icon(Icons.favorite, color: Colors.red);
  }
  return Icon(Icons.favorite_border);
}