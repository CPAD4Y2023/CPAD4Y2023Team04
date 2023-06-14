import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/screens/colleges/college_list.dart';
import 'dart:convert';
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

  Future fetchDegreeColleges() async {
    var degreeCourseName = "Computer Science";
    final response = await http.get(Uri.parse(
        'https://recom.cfapps.sap.hana.ondemand.com/v1/colleges?subject=$degreeCourseName'));
    print("response recd");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("response");
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
}
