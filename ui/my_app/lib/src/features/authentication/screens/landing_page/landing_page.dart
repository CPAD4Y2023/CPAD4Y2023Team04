import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/screens/articles/articleList.dart';
import 'package:my_app/src/features/authentication/screens/colleges.dart/college_list.dart';
import 'package:my_app/src/features/authentication/screens/courses/coursePage.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  // relevant images for articles
  final items = [
    splashScreenImage,
    splashScreenImage2,
    splashScreenImage3,
    welcomeScreenImage2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Page heading'),
      ),
      body: Column(children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
          ),
          itemCount: items.length,
          itemBuilder: (context, itemIndex, realIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(items[itemIndex]),
                width: 500,
              ),
            );
          },
        ),
        Container(
            padding: EdgeInsets.all(40),
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CollegeList()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(tDefaultSize),
                      margin: EdgeInsets.all(10.0),
                      height: 20,
                      width: 30,

                      // color: Colors.teal,
                      child: Text("Option 1"),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.teal, width: 5),
                          shape: BoxShape.rectangle),
                    )),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => courseList()));
                    },
                    child: Container(
                  padding: EdgeInsets.all(tDefaultSize),
                  margin: EdgeInsets.all(10.0),
                  height: 20,
                  width: 30,
                  // color: Colors.teal,
                  child: Text("Option 2"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.teal, width: 5),
                      shape: BoxShape.rectangle),
                )),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => articleList()));
                    },
                    child: Container(
                  padding: EdgeInsets.all(tDefaultSize),
                  margin: EdgeInsets.all(10.0),
                  height: 20,
                  width: 30,
                  // color: Colors.teal,
                  child: Text("Option 3"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.teal, width: 5),
                      shape: BoxShape.rectangle),
                )),
                GestureDetector(
                    child: Container(
                  padding: EdgeInsets.all(tDefaultSize),
                  margin: EdgeInsets.all(10.0),
                  height: 20,
                  width: 30,
                  // color: Colors.teal,
                  child: Text("Option 4"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.teal, width: 5),
                      shape: BoxShape.rectangle),
                ))
              ],
            ))
      ]),
    );
  }
}
