import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final items = [
    splashScreenImage,
    splashScreenImage2,
    splashScreenImage3,
    welcomeScreenImage2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          // Important: Remove any padding from the ListView.
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                //
                child: Row(
                  children: [
                    
                    CircleAvatar(foregroundImage: AssetImage(welcomeScreenImage2),radius: 45),
                    Container(child: Text('Hello <UserName>'),margin: EdgeInsets.all(5.0))
                    
                  ],
                )),
            ListTile(
              title: const Text('Update Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Terms Of Use'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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
