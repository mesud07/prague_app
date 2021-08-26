import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/sizes_helper.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/how_it_works.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/prague_coolpass_card.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/what_is_included.dart';

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
                BuildMenuItem(text: "Prague CoolPass & Card",icon: Icons.smartphone,),
              BuildMenuItem(text: "What is included",icon: Icons.article,),
              BuildMenuItem(text: "How it works",icon: Icons.description,),
              BuildMenuItem(text: "How you save",icon: Icons.thumb_up,),
              BuildMenuItem(text: "Conditions of use",icon: Icons.import_contacts_outlined,),

            ],

          ),
          BuildMenuItem(text: "BUY COOLPASS",icon: Icons.credit_card,),
          BuildMenuItem(text: "MY PASSES",icon: Icons.smartphone),
          BuildMenuItem(text: "ATTRACTIONS",icon: Icons.attractions),
          BuildMenuItem(text: "CURRENT NOTICES",icon: Icons.warning_outlined),
          BuildMenuItem(text: "SALE / COLLECTİON POINTS",icon: Icons.place),
          BuildMenuItem(text: "FAQ",icon: Icons.help_outline),

          ExpansionTile(
            leading:Icon(Icons.info,color: Colors.black,),
            title: const Text("USEFUL INFO"),
            trailing: Icon(Icons.arrow_right),
            children: [
              BuildMenuItem(text: "Emergency Numbers",icon: Icons.phone),
              BuildMenuItem(text: "Currency",icon: Icons.attach_money),
              BuildMenuItem(text: "Prague Weather",icon: Icons.cloud),
              BuildMenuItem(text: "Public Holidays",icon: Icons.event),
              BuildMenuItem(text: "Public Transport Map",icon: Icons.directions_subway),
              BuildMenuItem(text: "Website",icon: Icons.public),
            ],

          ),
          ExpansionTile(
            leading:Icon(Icons.settings,color: Colors.black,),
            title: const Text("LANGUAGE & SETTINGS"),
            trailing: Icon(Icons.arrow_right),
            children: [
              BuildMenuItem(text: "Languages",icon: Icons.language,onClick: (){}),
              BuildMenuItem(text: "Permissions",icon: Icons.warning_outlined),
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
      onTap: ()=>onClick,
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




