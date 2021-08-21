import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/model/slidermodel.dart';
import 'package:prague_app/widgets/slide_dots.dart';
import 'dart:async';

class IntroductionPages extends StatefulWidget {
  @override
  _IntroductionPagesState createState() => _IntroductionPagesState();
}

class _IntroductionPagesState extends State<IntroductionPages> {
  int _bottomindex = 0;
  int currentpage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentpage < 2) {
        currentpage++;
      } else {
        currentpage = 0;
      }

      _pageController.animateToPage(currentpage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  _onPageChanged(int index) {
    setState(() {
      currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        backgroundColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios,color: Colors.white,), title: Text("Skip",style: GoogleFonts.rubik(color: Colors.black),)),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,), title: Text("Go Home",style: GoogleFonts.rubik(color: Colors.black),))
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: pageItemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          debugPrint(pageItemList[2].urlname);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pageItemList[index].urlname),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 350,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      pageItemList[index].title,
                      style:
                          GoogleFonts.ubuntu(fontSize: 26, color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    pageItemList[index].description,
                    style:
                        GoogleFonts.ubuntu(fontSize: 20, color: Colors.white),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < pageItemList.length; i++)
                            if (i == currentpage)
                              SlideDots(
                                isActive: true,
                              )
                            else
                              SlideDots(
                                isActive: false,
                              )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
