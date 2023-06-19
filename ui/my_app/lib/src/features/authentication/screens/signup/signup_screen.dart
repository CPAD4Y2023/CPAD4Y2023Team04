
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/dataCollection/dataCollection.dart';
import 'package:my_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:my_app/src/features/authentication/screens/signup/signupController.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
      final controller = Get.put(SignUpController());
    var height = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 30),
          Image(image: AssetImage(logo), height: height * 0.2,alignment: Alignment.center,),
          Text(tSignupTitle,   textAlign:TextAlign.center ),
          Text(tSignupSubtitle),


            Form(child: Container(padding: EdgeInsets.symmetric(vertical: 20.0),child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText : tUserName,
                  hintText : tUserName,
                  border: OutlineInputBorder()),
                    onChanged: (value) {
                    controller.setUserName(value);
                            // print("The value entered is : $value");
                      }
                ),
             
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.fingerprint),
                  labelText : tPassword,
                  hintText : tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: null,icon:Icon(Icons.remove_red_eye_sharp))),
                    onChanged: (value) {
                    controller.setPassword(value);
                            // print("The value entered is : $value");
                      },
                       obscureText: true, 
                      
                ),
                
                SizedBox(height: 20),
                SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){
                controller.signupUser();
                  // Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => DataCollection()));
                }, child: Text(tSignUP.toUpperCase())))
              ],
            )
            )
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("OR"),
                
                SizedBox(width:double.infinity ,child:OutlinedButton.icon(icon : Image(image: AssetImage(googleLogoImage),width: 20.0,),onPressed: (){}, label: Text(tSignInWithGoogle))),

                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));}, child: const Text.rich(TextSpan(text:tALreadyHaveAnAccount, children: [TextSpan(text: tLogin, style: TextStyle(color: Colors.blue))])))
              ],
            )
          ],
        ),
    ),
      ),
    );
    
  }
}