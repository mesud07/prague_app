import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/mapsample.dart';
import 'package:prague_app/utils/widgets/appbar.dart';
import 'package:prague_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:prague_app/view/attractions_page.dart';
import 'package:prague_app/view/buycp.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/about_benefits.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/faqmenu.dart';
import 'package:prague_app/view/homepage.dart';


class NavigatorPage extends StatefulWidget {


  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
   int _selectedIndex=0;

  static TextStyle style1 = GoogleFonts.ubuntu(
      fontSize: 20, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: _selectedIndex == 0
            ? Text("PRAGUE CoolPass", style: style1,)
            : _selectedIndex == 1 ? Text("Attractions", style: style1,) : _selectedIndex == 2
            ? Text("My CoolPass", style: style1,) : _selectedIndex==3 ? Text("My CoolPass", style: style1,)
            : _selectedIndex == 4 ? Text("FAQ", style: style1,) : null,
        backgroundColor: Colors.white,
        bottom: _selectedIndex == 1 ? PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500)
            ),

            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {}, icon: Icon(Icons.favorite_outlined,),),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6),


                  alignment: Alignment.center,
                  height: 100,
                  width: 220,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffced6e0),
                          blurRadius: 1,
                          spreadRadius: 0.2)
                    ],
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton.icon(
                        icon: Icon(Icons.location_on, color: Colors.black,),
                        label: Text("Map", style: TextStyle(
                            color: Colors.black),),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,

                        ),),
                      Divider(height: 100, indent: 2.0, color: Colors.black,),
                      ElevatedButton.icon(
                          icon: Icon(Icons.filter_list, color: Colors.black,),
                          label: Text("Filter", style: TextStyle(
                              color: Colors.black)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.0,
                            shadowColor: Colors.transparent,

                          ))


                    ],
                  ),),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),

              ],
            ),
          ),

        ) : null,
      ),
      drawer: NavigationDrawerWidget(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 12),
        iconSize: 24,
        fixedColor: Colors.deepOrange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore",),
          BottomNavigationBarItem(
            icon: Icon(Icons.attractions,), label: "Attractions",),
          BottomNavigationBarItem(
            icon: Icon(Icons.smartphone,), label: "My Pass",),
          BottomNavigationBarItem(icon: Icon(Icons.female,), label: "Buy CP",),
          BottomNavigationBarItem(icon: Icon(Icons.info,), label: "FAQ",)
        ],
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint("basılan bottom " + _selectedIndex.toString());
    });
  }

}

