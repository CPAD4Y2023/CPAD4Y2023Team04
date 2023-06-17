import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:my_app/src/features/authentication/constants/colours.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fad_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
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
                    child: Text("",
                        style: TextStyle(
                          
                            fontWeight: FontWeight.w900,
                            fontSize: 40))),
                            SizedBox(height: 20),
                Align(
                    alignment: Alignment.topCenter,
                    child: Text("Pragati",
                        style: TextStyle(
                          
                            fontWeight: FontWeight.w900,
                            fontSize: 40))),
                            SizedBox(height: 20),
                Align(
                    alignment: Alignment.center,
                    child: Text(tTagLine,
                        style: TextStyle(
                            
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 20)))
              ],
            )),
            TFadeInAnimation(durationInMs: 1600,child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(logo),
                      fit: BoxFit.contain,
                    ),
                  )),animate: TAmimatePosition(bottomAfter:30, bottomBefore: -80)),
          ],
        ),
      ),
    );
  }
}


