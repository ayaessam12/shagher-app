import 'Pagination.dart';
import 'Ads.dart';

class Data {
  Data({
      this.pagination, 
      this.ads,});

  Data.fromJson(dynamic json) {
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['ads'] != null) {
      ads = [];
      json['ads'].forEach((v) {
        ads?.add(Ads.fromJson(v));
      });
    }
  }
  Pagination? pagination;
  List<Ads>? ads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    if (ads != null) {
      map['ads'] = ads?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}