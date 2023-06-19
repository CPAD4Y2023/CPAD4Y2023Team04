import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page_controller.dart';
import 'package:my_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:my_app/src/features/authentication/screens/updateProfile/updateprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pageDrawer extends StatelessWidget {
  const pageDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingController());
    controller.fetchUsername();
    return Drawer(
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

                  CircleAvatar(foregroundImage: AssetImage(user),radius: 45),
                  Container(child: Text(controller.username.value),margin: EdgeInsets.all(5.0))

                ],
              )),
          ListTile(
            title: const Text('Update Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfile()));
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
                onTap: () async{
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("loggedIn", false);
                  Navigator.pop(context);
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}