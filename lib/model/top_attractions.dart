class TopAttractions{

  String id;
  String type;
  String phone;
  String website;

  TopAttractions({required this.id,required this.type,required this.phone,required this.website});

  factory TopAttractions.fromJson(Map<String, dynamic> json)=> TopAttractions(
    id:json['id'],
    type:json['type'],
    phone:json['phone'],
    website:json['website'],

  );

}