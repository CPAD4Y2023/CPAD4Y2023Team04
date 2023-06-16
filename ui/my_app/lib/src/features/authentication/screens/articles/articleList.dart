import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/src/ApiCalls/fetchData.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/pageDrawer.dart';
import 'package:my_app/src/models/news.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class articleList extends StatelessWidget {
  articleList({Key? key}) : super(key: key);

  final controller = Get.put(FetchData());
  final items = [
    splashScreenImage,
    splashScreenImage2,
    splashScreenImage3,
    welcomeScreenImage2
  ];
  // final articles  = ["article1", "article2" , "article3"];
  // News news1 = News(link: "link", text: "Article1", type: "SPORTS");
  // News news2 = News(link: "link", text: "Article2", type: "TECH");
  // News news3 = News(link: "link", text: "Article3", type: "FINANCE");

  @override
  Widget build(BuildContext context) {
    //  List<News> articles = <News>[news1,news2,news3];
    controller.fetchNews();
    return Scaffold(
      drawer: pageDrawer(),
      appBar: AppBar(
        title: Text('Page heading'),
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
                itemCount: controller.news.value.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                      onTap: ()  {
                        controller.url.value = controller.news.value[position].link;
                        controller.launchingUrl();
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            controller.news.value[position].text,
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
