import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 40,
        title: Center(child: Text("PRAGUE CoolPass",style: GoogleFonts.ubuntu(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1),),),

      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
