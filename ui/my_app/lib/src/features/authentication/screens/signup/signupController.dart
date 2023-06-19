import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/dataCollection/dataCollection.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class SignUpController extends GetxController{
  static SignUpController get find =>Get.find();
  RxBool animate = false.obs;


   var username ="";
   var password = "";
 

    Future signupUser() async{

      final prefs = await SharedPreferences.getInstance();
        prefs.setString("username", username);
    
 var bytes = utf8.encode(password);
   var digest = sha256.convert(bytes);
    final http.Response response = await http.post(
    Uri.parse('http://a38c9e27f8e7d4a88bd0c152a63238b7-1645069970.eu-central-1.elb.amazonaws.com/v1/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  
    body: jsonEncode(<String, String>{
     'username' : username,
      'password': digest.toString(),
    }),
  );
    prefs.setBool("loggedIn", true);

Fluttertoast.showToast(  
        msg: 'Signup successful',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.teal[100],  
        textColor: Colors.black  
    );  
  Get.offAll(()=> const DataCollection());
   
 
  }

void setUserName(value)
{
  username = value;
}
void setPassword(value)
{
  password = value;
}
  
}