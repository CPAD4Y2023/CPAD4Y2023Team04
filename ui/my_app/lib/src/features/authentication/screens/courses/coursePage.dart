import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_app/src/ApiCalls/fetchData.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';
import 'package:get/get.dart';

class courseList extends StatelessWidget {
  courseList({Key? key}) : super(key: key);
  // relevant images for courses
  final items = [
    a4,
    a5,
    a2,
    a6
  ];
   final controller = Get.put(FetchData());
  @override
  Widget build(BuildContext context) {
    //  List<News> articles = <News>[news1,news2,news3];
    controller.fetchCourses();
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Courses'),
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
                itemCount: controller.courses.value.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                      onTap: ()  {
                        controller.url.value = controller.courses.value[position].link;
                        controller.launchingUrl();
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            controller.courses.value[position].course,
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


