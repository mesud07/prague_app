import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/mapsample.dart';
import 'package:prague_app/view/attractions_page.dart';
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



void main() {
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
        "/" :(context)=> NavigatorPage(),
        "/homePage": (context)=>HomePage(),
        "/attractions" : (context)=> AttractionsPage(),
        "/detailpage" : (context)=>DetailPage(),
        "/pragueCoolPassCard" : (context)=>PragueCoolPassCard(),
        "/whatIsIncluded" : (context)=>WhatIs_Included(),
        "/howItWorks": (context)=>HowItWorks(),
        "/howYouSave": (context)=>HowYouSave(),
        "/conditionsOfUse": (context)=>ConditionsOfUse(),
        "/currentNotices": (context)=>CurrentNotices(),
        "/saleCollection" : (context)=>SaleCollection(),
        "/faq" : (context)=> FaqMenu(),
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
      },
        onGenerateRoute: (settings){
          List<String> filtered = settings.name!.split("/");
          if(filtered[1]=="filteredPage"){
            print("2. değer : "+filtered[2]);
            return MaterialPageRoute(builder: (context)=>FilteredPage(filtered[2]));
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
