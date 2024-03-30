import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../EntitiesResponse.dart';
import 'AdvertisementResponse.dart';
import 'JobsDetailsResponse.dart';
import 'SectionResponse.dart';
import 'SubmitData.dart';
class ApiManager {
  static const String baseUrl = 'https://shaghr.info/ar/api/';

  static Future<EntitiesResponse> getEntities() async {
    Map<String, String> requestHeaders = {

      'Accept-Language': 'ar-AR',
    };
    final url = Uri.parse('https://shaghr.info/ar/api/entities');


    var response = await http.get(url, headers: requestHeaders);
    return EntitiesResponse.fromJson(jsonDecode(response.body));
  }


  /////////////////////////////////////////////////////


  static Future<AdvertisementResponse> getAdvertise() async {
    final url = Uri.parse('https://shaghr.info/ar/api/advertisements');


    var response = await http.get(url);
    return AdvertisementResponse.fromJson(jsonDecode(response.body));
  }

/////////////////////////////////////////////
  static Future<JobsDetailsResponse> getJobDetails() async {
    final url = Uri.parse('https://shaghr.info/ar/api/jobs');
    var response = await http.get(url);

    return JobsDetailsResponse.fromJson(jsonDecode(response.body));
  }


/////////////////////////////////


  static Future<SubmitData> postData(dynamic name, dynamic phone_Number,
      dynamic email, dynamic msg) async {
    final url = Uri.parse('https://shaghr.info/ar/api/contact/store');

    var response = await http.post(url, body: {
      "name": name,
      "email": email,
      "phone_number": phone_Number,
      "msg": msg
    });
    print(response.body);
    return SubmitData.fromJson(jsonDecode(response.body));
  }

//////////////////////////////////////////////////
  static Future<SectionResponse> getSection() async {
    
    final url = Uri.parse('https://shaghr.info/ar/api/sections'


    );

    var response = await http.get(url);


    return SectionResponse.fromJson(jsonDecode(response.body));
  }

}








