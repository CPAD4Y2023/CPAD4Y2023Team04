import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/dataCollection/dataCollectionController.dart';
import 'package:my_app/src/features/authentication/screens/forgot_password/forgot_password_mail.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/login/loginController.dart';
import 'package:my_app/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class DataCollection extends StatelessWidget {
  const DataCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataCollectionController());
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Align(
                    alignment: Alignment.topCenter,
                    child: Text("Tell us about you!",
                        style: TextStyle(
                          
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Colors.teal[900]))),
                            SizedBox(height: 20),
              
              TextFormField(
                // The validator receives the text that the user has entered.
                decoration: const InputDecoration(
                  icon: const Icon(Icons.sports_soccer),
                  hintText:
                      'Enter values separated by commas: puzzles, writing',
                  labelText: 'Tell us about your hobbies!',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                // The validator receives the text that the user has entered.
                decoration: const InputDecoration(
                  icon: const Icon(Icons.code),
                  labelText: 'What are you good at?',
                  hintText: 'Tell us about your skills! Eg: python,java',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                // The validator receives the text that the user has entered.
                decoration: const InputDecoration(
                  icon: const Icon(Icons.psychology),
                  labelText: 'What\'s your personality type?',
                  hintText: 'Don\'t know the personality type? Take the test!',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
                SizedBox(height: 10),
              TextFormField(
                // The validator receives the text that the user has entered.
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assignment),
                  labelText: 'What\'s your interests',
                  hintText: ' Type your interests (Tech, Finance, Sports)',
                  
                ),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                
              ),
             SizedBox(height: 50),

              SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){

                controller.setPreferences();
              }, child: Text("Next")))

            ],
          ),
        ),
      ),
    );
  }
}
