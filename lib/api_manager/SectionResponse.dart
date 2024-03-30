import 'dart:convert';
/// success : true
/// data : {"pagination":{"total":1,"count":1,"perPage":5,"currentPage":1,"totalPages":1},"sections":[{"id":1,"title":"Section ARr","logo":"https://shaghr.info/uploads/sections-logo/LCmhvtLPK7cX1690611312_64cd366626307.png"}]}
/// message : "All Sections sent"

SectionResponse sectionResponseFromJson(String str) => SectionResponse.fromJson(json.decode(str));
String sectionResponseToJson(SectionResponse data) => json.encode(data.toJson());
class SectionResponse {
  SectionResponse({
      bool? success, 
      Data? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  SectionResponse.fromJson(dynamic json) {
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
/// sections : [{"id":1,"title":"Section ARr","logo":"https://shaghr.info/uploads/sections-logo/LCmhvtLPK7cX1690611312_64cd366626307.png"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Pagination? pagination, 
      List<Sections>? sections,}){
    _pagination = pagination;
    _sections = sections;
}

  Data.fromJson(dynamic json) {
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['sections'] != null) {
      _sections = [];
      json['sections'].forEach((v) {
        _sections?.add(Sections.fromJson(v));
      });
    }
  }
  Pagination? _pagination;
  List<Sections>? _sections;

  Pagination? get pagination => _pagination;
  List<Sections>? get sections => _sections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_sections != null) {
      map['sections'] = _sections?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "Section ARr"
/// logo : "https://shaghr.info/uploads/sections-logo/LCmhvtLPK7cX1690611312_64cd366626307.png"

Sections sectionsFromJson(String str) => Sections.fromJson(json.decode(str));
String sectionsToJson(Sections data) => json.encode(data.toJson());
class Sections {
  Sections({
      int? id, 
      String? title, 
      String? logo,}){
    _id = id;
    _title = title;
    _logo = logo;
}

  Sections.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _logo = json['logo'];
  }
  int? _id;
  String? _title;
  String? _logo;

  int? get id => _id;
  String? get title => _title;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
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