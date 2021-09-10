import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/sizes_helper.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/how_it_works.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/prague_coolpass_card.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/what_is_included.dart';


class BuildMenu extends StatelessWidget{
  late String text;
  late IconData icon;
  VoidCallback? onClick;
  @override
  Widget build(BuildContext context){



      return ListTile(

        leading:Icon(Icons.add,color: Colors.black,),
        title: Text("gelgel",style: TextStyle(color: Colors.black),),
        onTap: ()=>Navigator.pushNamed(context, "/attractions"),
      );
    }
  }


class NavigationDrawerWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: ListView(
        children: [
          ExpansionTile(
            leading:Icon(Icons.description,color: Colors.black,),
            title: const Text("COOLPASS",style: TextStyle(color: Colors.black),),
            children: [
                BuildMenuItem(text: "Prague CoolPass & Card",icon: Icons.smartphone,onClick: ()=>Navigator.pushNamed(context, "/pragueCoolPassCard")),
              BuildMenuItem(text: "What is included",icon: Icons.article,onClick: ()=>Navigator.pushNamed(context, "/whatIsIncluded",)),
              BuildMenuItem(text: "How it works",icon: Icons.description,onClick: ()=>Navigator.pushNamed(context, "/howItWorks",)),
              BuildMenuItem(text: "How you save",icon: Icons.thumb_up,onClick: ()=>Navigator.pushNamed(context, "/howYouSave",)),
              BuildMenuItem(text: "Conditions of use",icon: Icons.import_contacts_outlined,onClick: ()=>Navigator.pushNamed(context, "/conditionsOfUse",)),

            ],

          ),
          BuildMenuItem(text: "BUY COOLPASS",icon: Icons.credit_card,onClick: ()=>Navigator.pushNamed(context, "/buycp",)),
          BuildMenuItem(text: "MY PASSES",icon: Icons.smartphone,onClick: ()=>Navigator.pushNamed(context, "/buycp",)),
          BuildMenuItem(text: "ATTRACTIONS",icon: Icons.attractions, onClick: ()=>Navigator.pushNamed(context, "/attractions",)),
          BuildMenuItem(text: "CURRENT NOTICES",icon: Icons.warning_outlined,onClick: ()=>Navigator.pushNamed(context, "/currentNotices",)),
          BuildMenuItem(text: "SALE / COLLECTİON POINTS",icon: Icons.place,onClick: ()=>Navigator.pushNamed(context, "/saleCollection",)),
          BuildMenuItem(text: "FAQ",icon: Icons.help_outline,onClick: ()=>Navigator.pushNamed(context, "/faq",)),

          ExpansionTile(
            leading:Icon(Icons.info,color: Colors.black,),
            title: const Text("USEFUL INFO"),
            trailing: Icon(Icons.arrow_right),
            children: [
              BuildMenuItem(text: "Emergency Numbers",icon: Icons.phone,onClick: ()=>Navigator.pushNamed(context, "/emergencyNumbers",)),
              BuildMenuItem(text: "Currency",icon: Icons.attach_money,onClick: ()=>Navigator.pushNamed(context, "/currency", )),
              BuildMenuItem(text: "Prague Weather",icon: Icons.cloud,onClick: ()=>Navigator.pushNamed(context, "/pragueWeather",)),
              BuildMenuItem(text: "Public Holidays",icon: Icons.event,onClick: ()=>Navigator.pushNamed(context, "/publicHoliday",)),
              BuildMenuItem(text: "Public Transport Map",icon: Icons.directions_subway,onClick: ()=>Navigator.pushNamed(context, "/publicTransportMap",)),
              BuildMenuItem(text: "Website",icon: Icons.public),
            ],

          ),
          ExpansionTile(
            leading:Icon(Icons.settings,color: Colors.black,),
            title: const Text("LANGUAGE & SETTINGS"),
            trailing: Icon(Icons.arrow_right),
            children: [
              BuildMenuItem(text: "Languages",icon: Icons.language,onClick: ()=>Navigator.pushNamed(context, "/languages")),
              BuildMenuItem(text: "Permissions",icon: Icons.warning_outlined,onClick: (){}),
            ],
          ),
        ],
      ),
    );
  }

  Widget BuildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClick})
  {
    return ListTile(

      leading:Icon(icon,color: Colors.black,),
      title: Text(text,style: TextStyle(color: Colors.black),),
      onTap: onClick,
    );
  }
}

selectedItem(BuildContext context, int index) {
    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PragueCoolPassCard()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WhatIs_Included()));

        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HowItWorks()));

        break;
      case 3:
        break;
      case 4:
        break;


    }

}


//appBar: AppBar(
//leading: Builder(
//builder: (BuildContext context) {
//return IconButton(
//
//color: Colors.black,
//icon: const Icon(Icons.menu),
//onPressed: () {
//Scaffold.of(context).openDrawer();
//},
//tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//);
//},
//),
//backgroundColor: Colors.white,
//toolbarHeight: 40,
//elevation: 30,
//title: Container(
//alignment: Alignment.center,
//color: Colors.white,
//width: displayWidth(context)*0.65,
//child: Text(
//"Attractions",
//style: GoogleFonts.ubuntu(
//color: Colors.black,
//fontWeight: FontWeight.bold,
//letterSpacing: 1),
//),
//),
//),
//
//
//
//