import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:prague_app/services/filter_service.dart';
class CircleButton extends StatefulWidget {
  final IconData iconData;
  final text;
  final int gelen;

CircleButton(this.iconData,this.text,this.gelen);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}
List category_idler = [
  "5f575890418c980b69d941bb",
  "5f57a9b9418c980b69d941bd",
  "59f5f6bd55b58747073c3e8c",
  "59f5f6c555b58747073c3e8d",
  "59f5f6b555b58747073c3e8b",
  "59f5f6cd55b58747073c3e8e",
  "5f5792d8418c980b69d941bc",
  "59f5f69a55b58747073c3e88",
  "59f5f6a155b58747073c3e89",
  "5f57b24a418c980b69d941be",
];
class _CircleButtonState extends State<CircleButton> {
  Box _cagirmakicin=Hive.box("filteredDeger");

  var filterList;
  List allFilter=[];
  bool isOk=false;
  late int totaldeger=0;
  @override
  Widget build(BuildContext context) {
    double size = 70.0;

    return ValueListenableBuilder(
      valueListenable: _cagirmakicin.listenable(),
      builder: (BuildContext context,Box box,_){
        print("box degeri "+_cagirmakicin.values.toString());
        print("total deger hive = "+totaldeger.toString());
        return InkWell(
          onTap: (){

            if(isOk==true){

              setState(() {
                isOk=false;

              });
            }else{
              filterList = loadAreaFilterData("categories",category_idler[widget.gelen]).whenComplete((){
                getir();


              });



              setState(() {
                isOk=true;


              });
            }
          },
          child: Column(
              children:[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: isOk==true?Colors.orange :Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.iconData,
                    color: isOk==true?Colors.white:Colors.black,
                  ),
                ),
                Container(
                  child: Text(widget.text,style: TextStyle(color:isOk==true?Colors.orange:Colors.black,fontSize: 13),),
                )
              ]
          ),
        );
      },
    );

  }

  getir()async{
    allFilter=await filterList;

    totaldeger+=allFilter.length;
    _cagirmakicin.putAt(0, totaldeger);
  }
}
