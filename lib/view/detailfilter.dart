import 'package:flutter/material.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:prague_app/utils/widgets/circle_button.dart';
import 'package:prague_app/utils/widgets/type_of_Entry.dart';

class DetailFilter extends StatefulWidget {
  const DetailFilter({Key? key}) : super(key: key);

  @override
  _DetailFilterState createState() => _DetailFilterState();
}

class _DetailFilterState extends State<DetailFilter> {
int eslesenDeger=0;
  List iconData=[Icons.museum_outlined,
    Icons.architecture,
    Icons.music_note_outlined,
    Icons.family_restroom_outlined,
    Icons.fastfood,
    Icons.shopping_bag,
    Icons.tour_outlined,
    Icons.airline_seat_flat,
    Icons.directions_walk,
    Icons.location_on_outlined];
  List circleTitle = [
    "Museums & History",
    "Art",
    "Music & Theatre",
    "Family",
    "Food & Drink",
    "Shopping",
    "Bus Tours",
    "Cruises",
    "Guided Walk",
    "Active Tours",
  ];
  List typeOfEntry = [
    "PRAGUE CASTLE",
    "OLD TOWN",
    "JEWISH QUARTER",
    "CHARKES BRIDGE",
    "LESSIER TOWN",
    "PETRIN HILL",
    "WENCESLAS SQUARE",
    "NEW TOWN",
    "VYSEHRAD CASTLE",
    "ZIZKOV",
    "HOLESOVİCE",
    "TROJA",
    "SMİCHOV",
    "OUTSİDE PRAGUE",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: header(context,"attractions"),
      bottomNavigationBar: MyBottomApp(context, "attractions"),
      bottomSheet: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrangeAccent,
              textStyle: TextStyle(
              fontSize: 20,)
          ),


          child: Text("Show Results ("+eslesenDeger.toString()+")"),
          onPressed: (){},
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Wrap(


              alignment: WrapAlignment.spaceEvenly,
              spacing: 10,
              runSpacing: 40,
              children: [
                for(var i=0;i<circleTitle.length;i++)
                CircleButton(iconData[i], circleTitle[i],i),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
              padding: EdgeInsets.all(10),
              child: Text("TYPE OF ENTRY" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          TypeOfEntry("Included in Prague Card", ),
          TypeOfEntry("Discount with Prague Card", ),
          TypeOfEntry("Admission Free", ),

          SizedBox(height: 20,),
          Container(
              padding: EdgeInsets.all(10),
              child: Text("PRAGUE DISTRICTS" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          for(var j=0;j<typeOfEntry.length;j++)
            TypeOfEntry(typeOfEntry[j])



        ],
      ),
    );
  }
}
