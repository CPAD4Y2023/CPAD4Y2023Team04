import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  static LoginController get find =>Get.find();
  RxBool animate = false.obs;

  String email = ""; 
   String password= "";  
   

    Future loginClick() async{

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedIn',true);
      Get.offAll(()=>  LandingPage());

      final response = await http.get(Uri.parse(
        'http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/login'));
      
         if (response.statusCode == 200) {
     
       
        List<dynamic> data = jsonDecode(response.body);
       
        for (int i = 0; i< data.length;i++)
        {
           if(data[i]['username'] == email && data[i]['password'] == password)
           {
            // route to landng page;
            Get.offAll(()=>  LandingPage());
           }
           else
           {
            // show popup that not successful
           }
        }
       

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load courses');
    }

 
  }

  void updateEmail(value)
  {
      email = value;
  }
   void updatePassword(value)
  {
      password = value;
  }



  
}