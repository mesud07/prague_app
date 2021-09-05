
import 'dart:convert';

List<FaqModel> faqFromJson(String str) =>
    List<FaqModel>.from(json.decode(str).map((x) => FaqModel.fromJson(x)));
class FaqModel {
  final String text;
  final String title;
  FaqModel({required this.text,required this.title,});

  factory FaqModel.fromJson(Map<String, dynamic> json)=> FaqModel(

    text:json['content']['en']['text'],
    title: json['content']['en']['title'],

  );}