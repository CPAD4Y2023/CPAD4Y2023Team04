import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataCollectionController extends GetxController{
  static DataCollectionController get find =>Get.find();
  RxBool animate = false.obs;


   var personality ="";
   var hobbies = "";
   var skills = "";
   var topics = "";

    Future updatePreferences() async{

      final prefs = await SharedPreferences.getInstance();
      var name = prefs.get("username"); 
      var username;
      if(name == null)
      {
        username = "";
      }
      else
      {
        username = name;
      }
        prefs.setString(pref_personality, personality);
      prefs.setString(pref_hobbies, hobbies);
      prefs.setString(pref_skills,skills);
      prefs.setString(pref_topics, topics);
    //  http.post(
    // Uri.parse('http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/info'),
    // headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    // body: jsonEncode(<String, String>{
    //   'username' : username,
    //   'personality': personality,
    //   'hobbies' : hobbies,
    //   'skills' : skills,
    //   'topics' : topics
    // }));

    final http.Response response = await http.post(
    Uri.parse('http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/info'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
     'username' : username,
      'personality': personality,
      'hobbies' : hobbies,
      'to_be_improved_skills' : skills,
      'interest_topics' : topics,
      'achievement' : ''
    }),
  );
   Get.offAll(()=> LandingPage());

   
      
     
      
 
  }

void setPersonality(value)
{
  personality = value;
}
void setHobbies(value)
{
  hobbies = value;
}
void setSkills(value)
{
  skills = value;
}
void setTopics(value)
{
  topics = value;
}
  
}