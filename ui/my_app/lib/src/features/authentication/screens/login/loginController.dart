import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  static LoginController get find => Get.find();
  RxBool animate = false.obs;

  String email = "";
  String password = "";

  Future loginClick() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('loggedIn', true);
    // Get.offAll(() => LandingPage());

 var bytes = utf8.encode(password);
   var digest = sha256.convert(bytes);
    final response = await http.get(Uri.parse(
        'http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/login'));
    var login = false;
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      for (int i = 0; i < data.length; i++) {
        if (data[i]['username'] == email && data[i]['password'] == digest.toString()) {
          // route to landng page;
          login = true;
          prefs.setBool("loggedIn", true);
          Fluttertoast.showToast(
              msg: 'Login Successful',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.teal[100],
              textColor: Colors.black);

          Fluttertoast.showToast(  
        msg: 'Fetching your preferences',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.teal[100],  
        textColor: Colors.black  
    ); 
          final response = await http.get(Uri.parse(
              'http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/info'));
          data = jsonDecode(response.body);

          for (int i = 0; i < data.length; i++) {
            if (data[i]['username'] == email)
            {
                  prefs.setString(pref_personality, data[i]['personality']);
                prefs.setString(pref_hobbies, data[i]['hobbies']);
                prefs.setString(pref_skills,data[i]['to_be_improved_skills']);
                prefs.setString(pref_topics, data[i]['interest_topics']);
                break;
            }
          }


          Get.offAll(() => LandingPage());
        }
      }
      // show popup that not successful
     if(login == false)
     { Fluttertoast.showToast(
          msg: 'Invalid username or password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red[100],
          textColor: Colors.black);}
    }
  }

  void updateEmail(value) {
    email = value;
  }

  void updatePassword(value) {
    password = value;
  }
}
