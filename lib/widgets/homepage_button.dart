import 'package:flutter/material.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/how_it_works.dart';
class Homepage_Button extends StatelessWidget {
String butontext;
IconData icon;


Homepage_Button(this.butontext,this.icon,);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: 170,
      child: InkWell(
        splashColor: Colors.yellowAccent,
        highlightColor: Colors.black,
        onTap: (){
          butontext=="ATTRACTIONS"? Navigator.pushNamedAndRemoveUntil(context, "/attractions", (route) => false):
              butontext=="MY COOLPASS"? Navigator.pushNamedAndRemoveUntil(context, "/buycp", (route) => false):
                  butontext=="TIPS & ALERRTS"? Navigator.pushNamed(context, "/currentNotices"):
                      butontext=="BUY COOLPASS"? Navigator.pushNamedAndRemoveUntil(context, "/buycp", (route) => false):
                          null;
        },//=>onClick,
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
//selectedBox(BuildContext context, int index) {
//  if(index==0){
//    return Navigator.pushNamed(context, "/");
//  }
//else if(index==1){
//  return Navigator.pushNamed(context, "/attractions");
//}
//else if(index==2){
//    return Navigator.pushNamed(context, "/attractions");
//  }else{
//
//}
//}




