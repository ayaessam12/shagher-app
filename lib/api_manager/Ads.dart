class Ads {
  Ads({
      this.id, 
      this.image,});

  Ads.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  int? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }

}