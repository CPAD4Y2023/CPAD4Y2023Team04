import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/colleges/college_list.dart';
import 'package:my_app/src/models/courses.dart';
import 'package:my_app/src/models/job.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  RxList<String> degreeCourses = <String>[].obs;
  RxList<News> news = <News>[].obs;
  RxList<Courses> courses = <Courses>[].obs;
  RxList<Job> jobs = <Job>[].obs;
  RxDouble loadingWidgetSize = 200.0.obs;
  RxDouble containerSize = 0.0.obs;

  


  Future fetchDegreeColleges(courseName) async {
    
    loadingWidgetSize = 200.0.obs;
    containerSize = 0.0.obs;
    // var degreeCourseName = "Computer Science";
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/colleges?subject=$courseName'));
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
      loadingWidgetSize.value = 0.0;
      containerSize.value = 500.0;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

  Future fetchNews() async {
    // todo: fetch topics from user data
    final prefs = await SharedPreferences.getInstance();
    var topics =prefs.getString(pref_topics);
    loadingWidgetSize = 200.0.obs;
    containerSize = 0.0.obs;
    
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/latestNews?topics=$topics'));
    if (response.statusCode == 200) {
     
        List<dynamic> allNews = jsonDecode(response.body);
        List<News> dataCopy = [];
        for (int i = 0; i< allNews.length;i++)
        {
          dataCopy.add(News.fromJson(allNews[i]));
        }
        loadingWidgetSize.value = 0.0;
      containerSize.value = 500.0;
      news.value = RxList.from(dataCopy);


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

  Future fetchJobs() async {
    // todo: fetch topics from user data
    final prefs = await SharedPreferences.getInstance();
    var skills =prefs.getString(pref_skills);
    loadingWidgetSize = 200.0.obs;
    containerSize = 0.0.obs;
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/jobs?skills=$skills'));
    if (response.statusCode == 200) {
     
        List<dynamic> allJobs = jsonDecode(response.body);
        List<Job> dataCopy = [];
        for (int i = 0; i< allJobs.length;i++)
        {
          dataCopy.add(Job.fromJson(allJobs[i]));
        }
        loadingWidgetSize.value = 0.0;
      containerSize.value = 500.0;
      jobs.value = RxList.from(dataCopy);


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

    Future fetchCourses() async {
      final prefs = await SharedPreferences.getInstance();
    var skills =prefs.getString(pref_skills);
      loadingWidgetSize = 200.0.obs;
    containerSize = 0.0.obs;
    // todo: fetch topics from user data
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/course?skills=$skills'));
    if (response.statusCode == 200) {
     
       
        List<dynamic> allCourses = jsonDecode(response.body);
        List<Courses> dataCopy = [];
        for (int i = 0; i< allCourses.length;i++)
        {
          dataCopy.add(Courses.fromJson(allCourses[i]));
        }
        loadingWidgetSize.value = 0.0;
      containerSize.value = 500.0;
      courses.value = RxList.from(dataCopy);


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

    Future fetchDegreeCourses() async {

      final prefs = await SharedPreferences.getInstance();
    var skills =prefs.getString(pref_skills);
    var hobbies = prefs.getString(pref_hobbies);
    var personality = prefs.getString(pref_personality);
      loadingWidgetSize = 200.0.obs;
    containerSize = 0.0.obs;
    // todo: fetch topics from user data
    
   
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/degreeCourses?hobbies=$hobbies&skills=$skills&personality=$personality'));
    if (response.statusCode == 200) {
     
       
        List<dynamic> data = jsonDecode(response.body);
       List<String> entries = [];
      for (int i = 0; i < data.length; i++) {
        entries.add(data[i]);
      }
      degreeCourses.value = RxList.from(entries);
      loadingWidgetSize.value = 0.0;
      containerSize.value = 500.0;


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }
  }

  // filtering data for articles
  
RxString url = "".obs;

 Future launchingUrl() async {
   Uri _url = Uri.parse(url.value);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}


}
