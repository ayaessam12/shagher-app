import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'Entities.g.dart';

@HiveType(typeId: 0)
class Entities extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? link;
  @HiveField(3)
  String? logo;
  Entities({
    this.id,
    this.name,
    this.link,
    this.logo,
  });

  Entities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['link'] = link;
    map['logo'] = logo;
    return map;
  }

  @override
  List<Object?> get props => [id, name, link, logo];
}
