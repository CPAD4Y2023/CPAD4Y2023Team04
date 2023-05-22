import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fad_in_animation_controller.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children : [
          TFadeInAnimation(durationInMs: 1200,
          animate: TAmimatePosition(bottomAfter:0, bottomBefore: -100,leftAfter: 0,leftBefore: 0,rightAfter: 0,rightBefore: 0,topAfter: 0,topBefore: 0),
          child:Container(
          padding: const EdgeInsets.all(tDefaultSize),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
        Image(image: AssetImage(welcomeScreenImage2), height: height * 0.6),
        Column(children: [Text("Welcome Title"), Text("Welcome Subtitle")]),
        Row(
          children: [
            Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );},
                    child: Text(tLogin.toUpperCase()))),
            SizedBox(width: 10.0),
            Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    onPressed: () {},
                    child: Text(tSignUP.toUpperCase())))
          ],
        )
        ]),
    ))]));
  }
}
