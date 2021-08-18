import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prague App',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: SliderPages(),
    );
  }
}

class SliderPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/slider1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(

            children: [
              SizedBox(height: 350,),
              Container(
                padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text("",style: TextStyle(fontSize: 18,color: Colors.white),)),
              Container(
                padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome to PRAGUE COOLPASS",style: TextStyle(fontSize: 26,color: Colors.white),)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("The mobile app of prague CoolPass (formaerly Prague Card) will guide "
                    "you to more than 100 best attractions in prague and enable you to buy a moile Pass or "
                    "smart Card to enjoy free entries to these attractions.",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),

              Container(
                height: 125,
                padding: EdgeInsets.all(40),
                  child: RaisedButton(elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: (){},child: Center(child: Text("Get Started",style: TextStyle(fontSize: 16,color: Colors.white),)),color: Colors.deepOrange,))
            ],
          ),
        ),
      ),
    );
  }
}
