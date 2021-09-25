
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prague_app/view/allmap.dart';
import 'package:prague_app/view/attractions_page.dart';
import 'package:prague_app/view/favorites.dart';
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}

Widget  MyBottomApp(BuildContext context,String name,) {
  return BottomAppBar(
      color: Colors.white,
      elevation: 9.0,
      notchMargin: 8.0,
      shape: CircularNotchedRectangle(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                    icon: name=="homepage"?Icon(Icons.search,color:Colors.orangeAccent,size: 20,):Icon(Icons.search,size: 20,color: Colors.black,),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                      print("homepage'a geçildi");

                    }),
                name=="homepage"? Text("Explore",style: style2,):Text("Explore",style: style1,)
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon: name=="attractions"? Icon(Icons.attractions,color:Colors.orangeAccent,size: 20,):Icon(Icons.attractions,color:Colors.black,size: 20,),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/attractions", (route) => false);
                      print("attractions'a geçildi");

                    }),
                name=="attractions"? Text("Attractions",style: style2,):Text("Attractions",style: style1,)

              ],
            ),
            Column(
              children: [
                IconButton(
                    icon: name=="mypass"?Icon(Icons.smartphone,color:Colors.orangeAccent,size: 20,):Icon(Icons.smartphone,color:Colors.black,size: 20,),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/buycp", (route) => false);
                      print("mypass'a geçildi");
                    }),
                name=="mypass"? Text("My Pass",style: style2,):Text("My Pass",style: style1,)

              ],
            ),
            Column(
              children: [
                IconButton(
                    icon: name=="buypass"? Icon(Icons.female,color:Colors.orangeAccent,size: 20,): Icon(Icons.female,color:Colors.black,size: 20,),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/buycoolpass", (route) => false);
                      print("buycoolpass'e geçildi");
                    }),
                name=="buypass"? Text("Buy CP",style: style2,):Text("Buy CP",style: style1,)

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon:name=="faq"? Icon(Icons.contact_support,color:Colors.orangeAccent,size: 20,):Icon(Icons.contact_support,color:Colors.black,size: 20,),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/faq", (route) => false);
                      print("faq'a geçildi");

                    }),
                name=="faq"? Text("FAQ",style: style2,):Text("FAQ",style: style1,)

              ],
            )
          ],
        ),
      ));
}
TextStyle titlestyle = GoogleFonts.ubuntu(
    fontSize: 22, color: Colors.black);
 TextStyle style1 = GoogleFonts.ubuntu(
    fontSize: 14, color: Colors.black);
TextStyle style2 = GoogleFonts.ubuntu(
    fontSize: 14, color: Colors.orangeAccent);
bool isMap=false;
bool isFavoritePage = false;


PreferredSizeWidget header(BuildContext context,String name) {

  return PreferredSize(
    preferredSize: name=="attractions" || name=="POINT" ? Size.fromHeight(100): Size.fromHeight(50),
    child: AppBar(
      centerTitle: true,
      title: name=="homepage" ?Text("PRAGUE CoolPass", style: titlestyle,):
      name=="attractions" ? Text("Attractions", style: titlestyle,):
      name=="attractions1" ? Text("Attractions", style: titlestyle,):

      name=="mypass" ? Text("My Pass", style: titlestyle,):
      name=="buypass"? Text("Buy Pass", style: titlestyle,):
      name=="faq"? Text("FAQ", style: titlestyle,):name=="currentnotices"? Text("Current Notices",style: titlestyle,):
      name=="POINT" ? Text("Points",style: titlestyle,):null,
      backgroundColor: Colors.white,
      bottom: name == "attractions" || name=="POINT"? PreferredSize(
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
                onPressed: () {

                  if(isFavoritePage==false){
                    isFavoritePage=true;
                    debugPrint(isFavoritePage.toString());
                    Navigator.pushNamed(context, "/favorites");
                  }else{

                    isFavoritePage=false;
                    debugPrint(isFavoritePage.toString());

                    Navigator.pushNamed(context, "/attractions");

                  }
                      
                }, icon: Icon(Icons.favorite_outlined,),),
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
                      onPressed: () {
                        if(isMap==false){
                          isMap=true;
                          debugPrint(isMap.toString());
                          Navigator.pushNamed(context, "/allmap");
                        }else{
                          isMap=false;
                          debugPrint(isMap.toString());
                          Navigator.pushNamed(context, "/attractions");
                        }
                      },
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
                        onPressed: () {
                          Navigator.pushNamed(context, "/detailfilter");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,

                        ))


                  ],
                ),),
              IconButton(onPressed: () {
                Navigator.pushNamed(context, "/searchPage");
              }, icon: Icon(Icons.search)),

            ],
          ),
        ),

      ) : name=="attractions1"?PreferredSize(

        preferredSize: Size.fromHeight(50),
        child: Container(

        )
      ):null,
    ),
  );
}





Widget MySliverAppBar(int index) {
  return SliverAppBar(


    bottom: index==1? PreferredSize(
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

    ):null,

      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      toolbarHeight: 60,
      centerTitle: true,
      title: Column(
        children: [
          Text("KAMPDA",style: TextStyle(color: Colors.black),),
        ],
      ),
      pinned: true,
      floating: true);
}






