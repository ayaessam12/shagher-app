import 'dart:convert';
/// success : true
/// data : {"name":"Test Name","email":"test@test.com","phone_number":"12345678","subject":"subject","message":"message","updated_at":"2023-09-26T12:27:04.000000Z","created_at":"2023-09-26T12:27:04.000000Z","id":10}
/// message : "Contact stored successfully"

SubmitData submitDataFromJson(String str) => SubmitData.fromJson(json.decode(str));
String submitDataToJson(SubmitData data) => json.encode(data.toJson());
class SubmitData {
  SubmitData({
      bool? success, 
      Data? data, 
      String? message,}){
    _success = success;
    _data = data;
    _message = message;
}

  SubmitData.fromJson(dynamic json) {
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

/// name : "Test Name"
/// email : "test@test.com"
/// phone_number : "12345678"
/// subject : "subject"
/// message : "message"
/// updated_at : "2023-09-26T12:27:04.000000Z"
/// created_at : "2023-09-26T12:27:04.000000Z"
/// id : 10

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? name, 
      String? email, 
      String? phoneNumber, 
      String? subject, 
      String? message, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _subject = subject;
    _message = message;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _subject = json['subject'];
    _message = json['message'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _subject;
  String? _message;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get name => _name;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get subject => _subject;
  String? get message => _message;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['subject'] = _subject;
    map['message'] = _message;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}