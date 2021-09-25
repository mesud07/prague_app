import 'package:flutter/material.dart';

class TypeOfEntry extends StatefulWidget{
  final text;
  TypeOfEntry(this.text);

  @override
  _TypeOfEntryState createState() => _TypeOfEntryState();
}

class _TypeOfEntryState extends State<TypeOfEntry> {
  bool isOk=false;

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return InkWell(
      onTap: (){
        if(isOk==true){
          setState(() {
            isOk=false;

          });
        }else{
          setState(() {
            isOk=true;

          });
        }
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10,right: 10),
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text,style: TextStyle(color: isOk==true?Colors.orange:Colors.black),),
            Icon(isOk==true?Icons.done:Icons.add,size: 18,color: isOk==true?Colors.orange:Colors.black,),
          ],
        ),
      ),
    );
  }
}