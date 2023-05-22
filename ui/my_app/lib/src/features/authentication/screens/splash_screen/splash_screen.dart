import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/controllers/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget{ SplashScreen({Key? key}) : super(key: key);
final splashScreenController= Get.put(SplashScreenController());


  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  
                  alignment: Alignment.topCenter,
                  child:Text("App Name",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 40))),
                Align(alignment: Alignment.center,child:Text("Tag Line",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 20)))
              ],
            )),
            Obx(()=>AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: splashScreenController.animate.value?200:-80,
              child:Container(
                width: 420,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash_screen.jpg'),
                    fit: BoxFit.contain,
                  ),
                )))),
          ],
        ),
      ),
    );
  }


}
