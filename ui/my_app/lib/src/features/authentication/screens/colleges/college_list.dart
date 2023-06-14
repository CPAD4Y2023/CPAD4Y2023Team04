import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/src/ApiCalls/fetchData.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';

class CollegeList extends StatelessWidget {
  CollegeList({Key? key}) : super(key: key);
  // relevant images for college
 
final controller = Get.put(FetchData());

  final items = [
    splashScreenImage,
    splashScreenImage2,
    splashScreenImage3,
    welcomeScreenImage2
  ];
  // final colleges  = ["College1", "College2" , "College3"];
  @override
  Widget build(BuildContext context) {

     
     controller.fetchDegreeColleges();
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Page heading'),
      ),
      body: Obx(()=>Column(children: [
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
          height: 500,
          child: ListView.builder(
          itemCount: controller.colleges.value.length,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  controller.colleges.value[position],
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),)
      ])),
    );
  }
}


