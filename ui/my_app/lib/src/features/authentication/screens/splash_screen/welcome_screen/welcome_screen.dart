import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image(image: AssetImage(welcomeScreenImage2), height: height * 0.6),
        Column(children: [Text("Welcome Title"), Text("Welcome Subtitle")]),
        Row(
          children: [
            Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    onPressed: () {}, child: Text(tLogin.toUpperCase()))),
            SizedBox(width: 10.0),
            Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    onPressed: () {}, child: Text(tSignUP.toUpperCase())))
          ],
        )
      ]),
    ));
  }
}
