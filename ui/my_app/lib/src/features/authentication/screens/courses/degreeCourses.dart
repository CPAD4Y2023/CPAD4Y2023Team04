import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_app/src/ApiCalls/fetchData.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/screens/colleges/college_list.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';
import 'package:get/get.dart';

class Degreecourses extends StatelessWidget {
  Degreecourses({Key? key}) : super(key: key);
  // relevant images for courses
  
  final items = [
    a3,
    a4,
    a5,
    a1
  ];
   final controller = Get.put(FetchData());
  @override
  Widget build(BuildContext context) {
    //  List<News> articles = <News>[news1,news2,news3];
    controller.fetchDegreeCourses();
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Degree Courses'),
      ),
      body: Obx(() => Column(children: [
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
            LoadingAnimationWidget.newtonCradle(
                color: Colors.teal,
                size: controller.loadingWidgetSize.value,

              ),
            Container(
              height: controller.containerSize.value,
              child: ListView.builder(
                itemCount: controller.degreeCourses.value.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                      onTap: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CollegeList(courseName: controller.degreeCourses.value[position])));
                       
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            controller.degreeCourses.value[position],
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ));
                },
              ),
            )
          ])),
    );
  }
}


