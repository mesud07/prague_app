import 'package:flutter/material.dart';

class BottomNavigation_Bar extends StatefulWidget{
  @override
  _BottomNavigation_BarState createState() => _BottomNavigation_BarState();
}

class _BottomNavigation_BarState extends State<BottomNavigation_Bar> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      iconSize: 24,
      fixedColor: Colors.deepOrange,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Explore",),
        BottomNavigationBarItem(icon: Icon(Icons.attractions,),label: "Attractions",),
        BottomNavigationBarItem(icon: Icon(Icons.smartphone,),label: "My Pass",),
        BottomNavigationBarItem(icon: Icon(Icons.female,),label: "Buy CP",),
        BottomNavigationBarItem(icon: Icon(Icons.info,),label: "FAQ",)
      ],
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint("basılan bottom "+ _selectedIndex.toString());
      if(_selectedIndex==0){
        debugPrint(_selectedIndex.toString());

      }else if(_selectedIndex==1){
        debugPrint(_selectedIndex.toString());
        Navigator.pushNamed(context,"/attractions");


      }


    });
  }
}
