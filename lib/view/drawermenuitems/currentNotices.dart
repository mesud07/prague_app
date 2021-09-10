import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/helper/sizes_helper.dart';
import 'package:prague_app/model/slidermodel.dart';

class CurrentNotices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,"currentnotices"),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
