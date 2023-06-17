import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/jobs/jobs.dart';
import 'package:my_app/src/features/authentication/screens/articles/articleList.dart';
import 'package:my_app/src/features/authentication/screens/colleges/college_list.dart';
import 'package:my_app/src/features/authentication/screens/courses/coursePage.dart';
import 'package:my_app/src/features/authentication/screens/courses/degreeCourses.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page_controller.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';
import 'package:get/get.dart';
class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  // relevant images for articles
  final items = [
    a1,
    a2,
    a3,
    a4
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingController());
    controller.addPreferences();
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Pagati'),
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
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: [
                Material(
                    color: Colors.teal[100],
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Degreecourses()));
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage(courses),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6),
                          Text('Find Degree Courses',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          SizedBox(height: 6)
                        ]))),
                Material(
                    color: Colors.teal[100],
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Jobs_List()));},
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage(jobs),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('Find Jobs',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          SizedBox(height: 6)
                        ]))),
                Material(
                    color: Colors.teal[100],
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => courseList()));
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage(onlinecourses),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('Find Online Courses',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          SizedBox(height: 6)
                        ]))),
                Material(
                    color: Colors.teal[100],
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => articleList()));
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage(news),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text('Get News',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          SizedBox(height: 6)
                        ])))
              ],
            ))
      ]),
    );
  }
}
