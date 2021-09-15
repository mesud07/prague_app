import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/dbhelper/databaseHelper.dart';
import 'package:prague_app/mapsample.dart';
import 'package:prague_app/utils/box_manager.dart';
import 'package:prague_app/view/attractions_page.dart';
import 'package:prague_app/view/buycp.dart';
import 'package:prague_app/view/detailPage.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/conditions_of_use.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/how_it_works.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/how_you_save.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/prague_coolpass_card.dart';
import 'package:prague_app/view/drawermenuitems/coolpass/what_is_included.dart';
import 'package:prague_app/view/drawermenuitems/currentNotices.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/about_benefits.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/attractionsfaq.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/cancellation_faq.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/faqmenu.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/howto_use.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/mobile_pass.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/other_faq.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/purchasefaq.dart';
import 'package:prague_app/view/drawermenuitems/faqMenu/transport_faq.dart';
import 'package:prague_app/view/drawermenuitems/languages_settings/languages.dart';
import 'package:prague_app/view/drawermenuitems/salecollection.dart';
import 'package:prague_app/view/drawermenuitems/useful_info/currency.dart';
import 'package:prague_app/view/drawermenuitems/useful_info/emergency_numbers.dart';
import 'package:prague_app/view/drawermenuitems/useful_info/prague_weather.dart';
import 'package:prague_app/view/drawermenuitems/useful_info/public_holidays.dart';
import 'package:prague_app/view/drawermenuitems/useful_info/public_transport_map.dart';
import 'package:prague_app/view/filteredPage.dart';
import 'package:prague_app/view/homepage.dart';
import 'package:prague_app/view/navigatorPage.dart';
import 'package:prague_app/widgets/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive/hive.dart';
import 'helper/datahelper.dart';


void main() async{
  await Hive.initFlutter();
  //await Hive.openBox<String>(BoxManager.instance.favoritesbox);
  await Hive.openBox("favoriListesi");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Prague App',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.transparent),
          ),
        primarySwatch: Colors.deepOrange,
        primaryIconTheme: IconThemeData(color: Colors.black)
      ),
      initialRoute: '/',
      routes:{
        "/": (context)=>HomePage(),
        "/pragueCoolPassCard" : (context)=>PragueCoolPassCard(),
        "/whatIsIncluded" : (context)=>WhatIs_Included(),
        "/howItWorks": (context)=>HowItWorks(),
        "/howYouSave": (context)=>HowYouSave(),
        "/conditionsOfUse": (context)=>ConditionsOfUse(),
        "/currentNotices": (context)=>CurrentNotices(),
        "/saleCollection" : (context)=>SaleCollection(),
        "/faq/aboutbenefits" : (context)=>AboutBenefits(),
        "/faq/howtouse" : (context)=>HowToUseFaq(),
        "/faq/mobilepass" : (context)=>MobilePassFaq(),
        "/faq/attractions" : (context)=>AttractionFaq(),
        "/faq/transport" : (context)=>TransportFaq(),
        "/faq/purchase" : (context)=>PurchaseFaq(),
        "/faq/cancellation_refund" : (context)=>CancellationFaq(),
        "/faq/other" : (context)=>OtherFaqPage(),
        "/emergencyNumbers" : (context)=> EmergencyNumber(),
        "/currency" : (context)=> Currency(),
        "/pragueWeather" : (context)=> PragueWeather(),
        "/publicHoliday" : (context)=> PublicHoliday(),
        "/publicTransportMap" : (context)=>PublicTransportMap(),
        "/languages" : (context)=> Languages(),
        "/currentNotices":(context)=>CurrentNotices(),
      },
        onGenerateRoute: (settings){
        //Navigator.pushNamedAndRemoveUntil(context, "/filteredPage/$_id", (route) => false);
          // Bu şekilde onGenerateRoute kısmına yolluyorum. Ardından split fonksiyonu ile ayırıyorum.
        //filtered[1] =filteredPAGE filtered[2] = _id değerim oluyor.
          List<String> filtered = settings.name!.split("/");
          switch(filtered[1]){
            //switch içinden filtered[1] değrimi eşleştiriyorum.Çünkü aynı sayfayı bir çok farklı data için kullanıyorum.

            case "filteredPage":
              return PageTransition(
                //ben filteredPage içinde bir fonksiyona eleman taşıyorum Sen sadece filtered[2] kullanarak yapabilirsin.
                child: FilteredPage("area",filtered[2]),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "categoryFilteredPage":
              return PageTransition(
                child: FilteredPage("category",filtered[2]),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );

            case "detailpage":
              return MaterialPageRoute(builder: (context)=>DetailPage(int.parse(filtered[2])));

            case "attractions":
              return PageTransition(
                child: AttractionsPage(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "buycp":
              return PageTransition(
                child: BuyCP(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
            case "faq":
              return PageTransition(
                child: FaqMenu(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: Duration(seconds: 0),
              );
          }

        }
    );
  }
}

class SliderPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionPages(),
      bottomNavigationBar: BottomAppBar(

        color: Colors.deepOrange,
        elevation: 70,
        child: Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                }, child: Text("Get Started",style: GoogleFonts.cinzel(fontSize: 20,color: Colors.white),)),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
