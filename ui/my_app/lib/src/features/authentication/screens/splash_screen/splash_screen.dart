import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/colours.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text("App Name",
                        style: TextStyle(
                          
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 40))),
                Align(
                    alignment: Alignment.center,
                    child: Text(tTagLine,
                        style: TextStyle(
                            
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 20)))
              ],
            )),
            Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: splashScreenController.animate.value ? 200 : -70,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: splashScreenController.animate.value ? 1 : 0,
                    child: Container(
                        width: 420,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(splashScreenImage3),
                            fit: BoxFit.contain,
                          ),
                        ))))),
          ],
        ),
      ),
    );
  }
}
