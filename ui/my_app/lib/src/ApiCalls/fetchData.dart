import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/colleges/college_list.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_app/src/models/news.dart';
// Future fetchColleges() async {
//   // TO do : make this dynamic
//   var courseName = "Computer Science";
//   final response = await http.get(Uri.parse('https://recom.cfapps.sap.hana.ondemand.com/v1/colleges?subject=$courseName'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return jsonDecode(response.body);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

class FetchData extends GetxController {
  static FetchData get find => Get.find();
  RxList<String> colleges = <String>[].obs;
  RxList<News> news = <News>[].obs;

  Future fetchDegreeColleges() async {
    var degreeCourseName = "Computer Science";
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/colleges?subject=$degreeCourseName'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      List<dynamic> data = jsonDecode(response.body);
      // colleges.addAll(item)
      List<String> entries = [];
      for (int i = 0; i < data.length; i++) {
        entries.add(data[i]);
      }
      colleges.value = RxList.from(entries);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

  Future fetchNews() async {
    // todo: fetch topics from user data
    var topics = "tech,finance,sports";
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/latestNews?topics=$topics'));
    if (response.statusCode == 200) {
     
        int a = 7;
        List<dynamic> allNews = jsonDecode(response.body);
        List<News> dataCopy = [];
        for (int i = 0; i< allNews.length;i++)
        {
          dataCopy.add(News.fromJson(allNews[i]));
        }
      news.value = RxList.from(dataCopy);


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

RxString url = "".obs;

 Future launchingUrl() async {
   Uri _url = Uri.parse(url.value);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}


}
