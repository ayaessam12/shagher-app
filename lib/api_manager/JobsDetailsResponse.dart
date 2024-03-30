import 'dart:convert';
/// success : true
/// data : {"pagination":{"total":1,"count":1,"perPage":5,"currentPage":1,"totalPages":1},"jobs":[{"id":1,"entity_id":1,"section_id":1,"location":"الرياض","date":"2023-08-07","details":"تفاصيل","type":1,"salary":"232","advantages":"مزايا","qualification":"مؤهل","communication":"communication","created_at":"منذ شهر","entity":{"id":1,"name":"EntityAr","link":"http://127.0.0.1:8000/en/dashboard/entities","logo":"https://shaghr.info/uploads/entities-logo/qFqnczqotAS11689414007_64cd3654bba89.jpg"}}]}
/// message : "All Jobs sent"

JobsDetailsResponse jobsDetailsResponseFromJson(String str) => JobsDetailsResponse.fromJson(json.decode(str));
String jobsDetailsResponseToJson(JobsDetailsResponse data) => json.encode(data.toJson());
class JobsDetailsResponse {
  JobsDetailsResponse({
      bool? success, 
      Data? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  JobsDetailsResponse.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;

  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// pagination : {"total":1,"count":1,"perPage":5,"currentPage":1,"totalPages":1}
/// jobs : [{"id":1,"entity_id":1,"section_id":1,"location":"الرياض","date":"2023-08-07","details":"تفاصيل","type":1,"salary":"232","advantages":"مزايا","qualification":"مؤهل","communication":"communication","created_at":"منذ شهر","entity":{"id":1,"name":"EntityAr","link":"http://127.0.0.1:8000/en/dashboard/entities","logo":"https://shaghr.info/uploads/entities-logo/qFqnczqotAS11689414007_64cd3654bba89.jpg"}}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Pagination? pagination, 
      List<Jobs>? jobs,}){
    _pagination = pagination;
    _jobs = jobs;
}

  Data.fromJson(dynamic json) {
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['jobs'] != null) {
      _jobs = [];
      json['jobs'].forEach((v) {
        _jobs?.add(Jobs.fromJson(v));
      });
    }
  }
  Pagination? _pagination;
  List<Jobs>? _jobs;

  Pagination? get pagination => _pagination;
  List<Jobs>? get jobs => _jobs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_jobs != null) {
      map['jobs'] = _jobs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// entity_id : 1
/// section_id : 1
/// location : "الرياض"
/// date : "2023-08-07"
/// details : "تفاصيل"
/// type : 1
/// salary : "232"
/// advantages : "مزايا"
/// qualification : "مؤهل"
/// communication : "communication"
/// created_at : "منذ شهر"
/// entity : {"id":1,"name":"EntityAr","link":"http://127.0.0.1:8000/en/dashboard/entities","logo":"https://shaghr.info/uploads/entities-logo/qFqnczqotAS11689414007_64cd3654bba89.jpg"}

Jobs jobsFromJson(String str) => Jobs.fromJson(json.decode(str));
String jobsToJson(Jobs data) => json.encode(data.toJson());
class Jobs {
  Jobs({
      int? id, 
      int? entityId, 
      int? sectionId, 
      String? location, 
      String? date, 
      String? details, 
      int? type, 
      String? salary, 
      String? advantages, 
      String? qualification, 
      String? communication, 
      String? createdAt, 
      Entity? entity,}){
    _id = id;
    _entityId = entityId;
    _sectionId = sectionId;
    _location = location;
    _date = date;
    _details = details;
    _type = type;
    _salary = salary;
    _advantages = advantages;
    _qualification = qualification;
    _communication = communication;
    _createdAt = createdAt;
    _entity = entity;
}

  Jobs.fromJson(dynamic json) {
    _id = json['id'];
    _entityId = json['entity_id'];
    _sectionId = json['section_id'];
    _location = json['location'];
    _date = json['date'];
    _details = json['details'];
    _type = json['type'];
    _salary = json['salary'];
    _advantages = json['advantages'];
    _qualification = json['qualification'];
    _communication = json['communication'];
    _createdAt = json['created_at'];
    _entity = json['entity'] != null ? Entity.fromJson(json['entity']) : null;
  }
  int? _id;
  int? _entityId;
  int? _sectionId;
  String? _location;
  String? _date;
  String? _details;
  int? _type;
  String? _salary;
  String? _advantages;
  String? _qualification;
  String? _communication;
  String? _createdAt;
  Entity? _entity;

  int? get id => _id;
  int? get entityId => _entityId;
  int? get sectionId => _sectionId;
  String? get location => _location;
  String? get date => _date;
  String? get details => _details;
  int? get type => _type;
  String? get salary => _salary;
  String? get advantages => _advantages;
  String? get qualification => _qualification;
  String? get communication => _communication;
  String? get createdAt => _createdAt;
  Entity? get entity => _entity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['entity_id'] = _entityId;
    map['section_id'] = _sectionId;
    map['location'] = _location;
    map['date'] = _date;
    map['details'] = _details;
    map['type'] = _type;
    map['salary'] = _salary;
    map['advantages'] = _advantages;
    map['qualification'] = _qualification;
    map['communication'] = _communication;
    map['created_at'] = _createdAt;
    if (_entity != null) {
      map['entity'] = _entity?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "EntityAr"
/// link : "http://127.0.0.1:8000/en/dashboard/entities"
/// logo : "https://shaghr.info/uploads/entities-logo/qFqnczqotAS11689414007_64cd3654bba89.jpg"

Entity entityFromJson(String str) => Entity.fromJson(json.decode(str));
String entityToJson(Entity data) => json.encode(data.toJson());
class Entity {
  Entity({
      int? id, 
      String? name, 
      String? link, 
      String? logo,}){
    _id = id;
    _name = name;
    _link = link;
    _logo = logo;
}

  Entity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _logo = json['logo'];
  }
  int? _id;
  String? _name;
  String? _link;
  String? _logo;

  int? get id => _id;
  String? get name => _name;
  String? get link => _link;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['link'] = _link;
    map['logo'] = _logo;
    return map;
  }

}

/// total : 1
/// count : 1
/// perPage : 5
/// currentPage : 1
/// totalPages : 1

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      int? total, 
      int? count, 
      int? perPage, 
      int? currentPage, 
      int? totalPages,}){
    _total = total;
    _count = count;
    _perPage = perPage;
    _currentPage = currentPage;
    _totalPages = totalPages;
}

  Pagination.fromJson(dynamic json) {
    _total = json['total'];
    _count = json['count'];
    _perPage = json['perPage'];
    _currentPage = json['currentPage'];
    _totalPages = json['totalPages'];
  }
  int? _total;
  int? _count;
  int? _perPage;
  int? _currentPage;
  int? _totalPages;

  int? get total => _total;
  int? get count => _count;
  int? get perPage => _perPage;
  int? get currentPage => _currentPage;
  int? get totalPages => _totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['count'] = _count;
    map['perPage'] = _perPage;
    map['currentPage'] = _currentPage;
    map['totalPages'] = _totalPages;
    return map;
  }

}