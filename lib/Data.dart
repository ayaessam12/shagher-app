import 'package:shagher/ui/favourite/favourites/models/Entities.dart';

import 'Pagination.dart';
import 'Entities.dart';

class Data {
  Data({
      this.pagination, 
      this.entities,});

  Data.fromJson(dynamic json) {
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['entities'] != null) {
      entities = [];
      json['entities'].forEach((v) {
        entities?.add(Entities.fromJson(v));
      });
    }
  }
  Pagination? pagination;
  List<Entities>? entities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    if (entities != null) {
      map['entities'] = entities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}