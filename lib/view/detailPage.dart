import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/mapsample.dart';
import 'package:prague_app/services/topAttractions_service.dart';
class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late double lat,lon;
  bool _favoriteActivate = false;
  @override

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
              child: FutureBuilder<List>(
                future: loadData(),
                builder: (BuildContext context,AsyncSnapshot<List> snapshot){
                  if(snapshot.data!=null){
                    lat=snapshot.data![0]["lat"];
                    lon = snapshot.data![0]["lon"];
                    debugPrint(snapshot.data![0]['content']['en']['title']);
                  }else{
                    debugPrint("boş");
                  }
                  if(snapshot.hasData){
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          debugPrint(snapshot.data![index]['content']['en']['title']);

                          return Column(
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
                                        image: NetworkImage("https://static2.praguecoolpass.com/"+snapshot.data![index]['webimages'][0])),
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
                              InkWell(
                                onTap: (){},
                                child: Container(

                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width,
                                  height: 30,
                                  child:Row(
                                    children: [
                                      Text("Read More",style: GoogleFonts.ubuntu(fontSize: 15,fontWeight: FontWeight.bold),),
                                      Icon(Icons.expand_more)
                                    ],
                                  ),


                                ),
                              ),
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
                                        child: Text("5.0",style: GoogleFonts.rubik(fontSize: 30,fontWeight: FontWeight.bold),)),
                                    Column(
                                      children: [Container(
                                          height: 25,
                                          width: MediaQuery.of(context).size.width /6,
                                          alignment: Alignment.topCenter,
                                          child: Text("****",style: GoogleFonts.rubik(fontSize: 30))),
                                        Container(
                                            alignment: Alignment.topCenter,
                                            height: 25,
                                            width: MediaQuery.of(context).size.width /6,
                                            child: Text("1 reviews"))],

                                    )
                                  ],

                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.grey.shade300,
                                alignment: Alignment.topLeft,
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(

                                    children: [
                                      Icon(Icons.light,size: 30,),
                                      Container(

                                        margin: EdgeInsets.all(4),
                                        child: Text("asadasdasdasdasadssssssssssssssssss",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,),
                                      ),
                                    ],
                                  ),
                                ),),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Divider(height: 20,color: Colors.grey,thickness: 1,indent: 15,endIndent: 15,)),
                              InkWell(
                                onTap: (){},
                                child: Container(

                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width,
                                  height: 30,
                                  child:Row(
                                    children: [
                                      Text("Price & Benefits",style: GoogleFonts.ubuntu(fontSize: 15,fontWeight: FontWeight.bold),),
                                      Icon(Icons.expand_more)
                                    ],
                                  ),


                                ),
                              ),
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
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.smartphone,size:25,color: Colors.black,))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: MediaQuery.of(context).size.width /4,
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.public,size:25,color: Colors.black,))),
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
