class TopAttractions{

  final String id;
  final String type;
  final String phone;
  final String website;
  final String content;

  //final List<String> webimages;


  TopAttractions({required this.id,
    required this.type,
    required this.phone,
    required this.website,
    required this.content,
    //required this.webimages,
    });

  factory TopAttractions.fromJson(Map<String, dynamic> json)=> TopAttractions(
    id:json['_id'],
    type:json['type'],
    phone:json['phone'],
    website:json['website'] ,
    content: json['content'],
    //webimages: List<String>.from(json['webimages']),

  );

}
