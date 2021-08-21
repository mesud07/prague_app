import 'package:flutter/material.dart';
class Homepage_Button extends StatelessWidget {
String butontext;
IconData icon;

Homepage_Button(this.butontext,this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: 170,
      child: InkWell(
        splashColor: Colors.yellowAccent,
        highlightColor: Colors.black,
        onTap: () async {},
        child: Material(
          elevation: 4,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                icon,
                color: Colors.deepOrange,
                size: 70.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),),
              Container(

                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 5),
                  child: Text(butontext,)),

            ]
          ),
        ),
      ),
    );
  }
}


