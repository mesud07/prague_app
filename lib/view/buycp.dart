import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/utils/widgets/appbar.dart';

class BuyCP extends StatefulWidget {
  @override
  _BuyCPState createState() => _BuyCPState();
}

class _BuyCPState extends State<BuyCP> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: header(context,"mypass"),
      bottomNavigationBar: MyBottomApp(context,"mypass"),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Container(
                  padding: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  child: Text("NO COOLPASS DOWNLOADED YET!",
                      style: GoogleFonts.rubik(
                        fontSize: 30,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center)),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20,bottom: 20),
                child: Text(
                    "If you have already bought the Prague Card and selected to receive it as a mobile CoolPass, please download it:",
                    style: GoogleFonts.rubik(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
              ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,

            ),
            child: ToggleButtons(

              isSelected: isSelected,
              selectedColor: Colors.white,
              color: Colors.black,
              fillColor: Colors.orangeAccent,
              renderBorder: false,
              //splashColor: Colors.red,
              highlightColor: Colors.orange,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('ALL PASSES', style: TextStyle(fontSize: 18))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:Text('SİNGLE PASSES', style: TextStyle(fontSize: 18))),
                ),
              ],
              onPressed: (int newIndex) {
                setState(() {
                  for (int index = 0; index < isSelected.length; index++) {
                    if (index == newIndex) {
                      isSelected[index] = true;
                    } else {
                      isSelected[index] = false;
                    }
                  }
                });
              },
            ),
          ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Text(
                    "Enter Order Referance Number to download all passes from your order.",
                    style: GoogleFonts.rubik(
                      fontSize: 17,
                      color: Colors.black,
                    ),textAlign: TextAlign.center),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 45,
                        child: TextField(

                          obscureText: true,
                          decoration: InputDecoration(
                          fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                          color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("SUBMIT",style: TextStyle(fontSize: 13),),
                        style: ElevatedButton.styleFrom(fixedSize: Size(80, 40),primary: Colors.orangeAccent),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: 150,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("BUY PRAGUE CARD",style: TextStyle(fontSize: 15),),
                  style: ElevatedButton.styleFrom(fixedSize: Size(MediaQuery.of(context).size.width, 50),primary: Colors.orangeAccent),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
