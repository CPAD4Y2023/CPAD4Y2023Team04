import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/common_widgets/fade_in_animation/fad_in_animation_controller.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animate,

  });

  final splashScreenController = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAmimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
        duration:  Duration(milliseconds: durationInMs),
        top: splashScreenController.animate.value ? animate!.topAfter : animate!.topBefore,
        left: splashScreenController.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: splashScreenController.animate.value ?animate!.bottomAfter : animate!.bottomBefore,
        right: splashScreenController.animate.value ? animate!.rightAfter : animate!.rightBefore,
        child: AnimatedOpacity(
            duration:  Duration(milliseconds: durationInMs),
            opacity: splashScreenController.animate.value ? 1 : 0,
            // child: Container(
            //     width: 420,
            //     height: 300,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(splashScreenImage3),
            //         fit: BoxFit.contain,
            //       ),
            //     ))
          child: child,
        )));
  }
}