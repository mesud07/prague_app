import 'package:flutter/material.dart';
import 'package:prague_app/utils/widgets/type_of_Entry.dart';

class BuyCoolPass extends StatefulWidget {
  const BuyCoolPass({Key? key}) : super(key: key);

  @override
  _BuyCoolPassState createState() => _BuyCoolPassState();
}

class _BuyCoolPassState extends State<BuyCoolPass> {
  int _currentStep=0;
  int secenek = 0;
  TextStyle style1=TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold);
  TextStyle style2=TextStyle(fontSize: 17,color: Colors.white,);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.orangeAccent,
        title: Container(
        child: ListTile(
        title: Text("Prague CoolPass / Prague Card",style: TextStyle(fontSize: 18,color: Colors.white),),
        trailing: IconButton(onPressed: (){
          Navigator.pushNamed(context, "/attractions").then((value) => print("geçildi"));

        },icon: Icon(Icons.close,color: Colors.white,)),

      ),),),
      body: Container(
        child: Stepper(

          controlsBuilder: (BuildContext context,{void Function()? onStepCancel,void Function()? onStepContinue}){
            return Container(
              height: MediaQuery.of(context).size.height*2/3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                      width: MediaQuery.of(context).size.width*1/5,
                      height: 50,
                      child: RaisedButton.icon(onPressed:onStepCancel,icon: Icon(Icons.arrow_back),label: Text(""),)),
                  SizedBox(width: 10,),
                  Container(
                      width: MediaQuery.of(context).size.width*3/5,
                      height: 50,
                      child: RaisedButton(onPressed:onStepContinue,child: Text("NEXT >",style: TextStyle(fontSize: 20),),color: Colors.orangeAccent,)),

                ],
              ),
            );
          },
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepTapped: (step)=>tapped(step),
          onStepCancel: cancel,
          onStepContinue: continued,
          steps: [
            Step(
              title: new Text(""),
              content: Column(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      secenek==0?null:secenek=0;

                      setState(() {
                      });
                    },
                    child: Column(

                      children: [
                        Text("SELECT NUMBER OF DAYS",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
                       SizedBox(height: 10,),
                        Stack(

                          children: [

                            Container(
                              margin:EdgeInsets.only(left: 20,right: 20),
                              padding: EdgeInsets.only(left: 50,right: 10),
                              height: 70,width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                              color: Colors.white,
                                border:secenek==0?Border.all(width: 2,color: Colors.orangeAccent):null,

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center ,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Container(
                                      child: Text("Adult")),Text("Student/Child")],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("71 EUR"),Text("51 EUR")],
                                )
                              ],
                            ),

                            ),
                            Container(margin:EdgeInsets.only(top: 10,),height: 50,width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              child: Column(children: [Text("2",style: style1,),Text("Days",style: style2,)],),),

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                      secenek==1?null:secenek=1;

                      setState(() {
                      });
                    },
                    child: Stack(

                      children: [

                        Container(
                          margin:EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 50,right: 10),
                          height: 70,width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:secenek==1?Border.all(width: 2,color: Colors.orangeAccent):null,

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Container(
                                    child: Text("Adult")),Text("Student/Child")],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text("81 EUR"),Text("58 EUR")],
                              )
                            ],
                          ),

                        ),
                        Container(margin:EdgeInsets.only(top: 10,),height: 50,width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                          child: Column(children: [Text("3",style: style1,),Text("Days",style: style2,)],),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                      onTap: (){
                        secenek==2?null:secenek=2;

                        setState(() {
                        });
                      },
                    child: Stack(

                      children: [

                        Container(
                          margin:EdgeInsets.only(left: 20,right: 20),
                          padding: EdgeInsets.only(left: 50,right: 10),
                          height: 70,width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: secenek==2 ? Border.all(width: 2,color: Colors.orangeAccent): null,

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center ,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Container(
                                    child: Text("Adult")),Text("Student/Child")],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text("88 EUR"),Text("64 EUR")],
                              )
                            ],
                          ),

                        ),
                        Container(margin:EdgeInsets.only(top: 10,),height: 50,width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                          child: Column(children: [Text("4",style: style1,),Text("Days",style: style2,)],),),

                      ],
                    ),
                  )

                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep >= 0 ?
              StepState.complete : StepState.disabled,
            ),
            Step(
                isActive: _currentStep >= 1,
                state: _currentStep >= 1 ?
                StepState.complete : StepState.disabled,
              title: Text(""),
              content: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Your Choice"),
                        Text("4 Days")
                      ],
                    ),
                    TypeOfEntry("Adult (16+)"),
                    TypeOfEntry("Students(16-25"),
                    TypeOfEntry("Total")
                  ],
                ),
              )
            ),
            Step(
                isActive: _currentStep >= 2,
                state: _currentStep >= 2 ?
                StepState.complete : StepState.disabled,
                title: Text(""),
                content: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Your Choice"),
                          Text("4 Days")
                        ],
                      ),
                      TypeOfEntry("Adult (16+)"),
                      TypeOfEntry("Students(16-25"),
                      TypeOfEntry("Total")
                    ],
                  ),
                )
            ),
            Step(
                isActive: _currentStep >= 3,
                state: _currentStep >= 3 ?
                StepState.complete : StepState.disabled,
                title: Text(""),
                content: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Your Choice"),
                          Text("4 Days")
                        ],
                      ),
                      TypeOfEntry("Adult (16+)"),
                      TypeOfEntry("Students(16-25"),
                      TypeOfEntry("Total")
                    ],
                  ),
                )
            ),
            Step(
                isActive: _currentStep >= 4,
                state: _currentStep >= 4 ?
                StepState.complete : StepState.disabled,
                title: Text(""),
                content: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Your Choice"),
                          Text("4 Days")
                        ],
                      ),
                      TypeOfEntry("Adult (16+)"),
                      TypeOfEntry("Students(16-25"),
                      TypeOfEntry("Total")
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
  tapped(int step){
    setState(() => _currentStep = step);
  }
  continued(){
    print(_currentStep.toString());
    _currentStep < 4 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}

