
import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/forgot_password/forgot_password_mail.dart';
import 'package:my_app/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:my_app/src/features/authentication/screens/login/loginController.dart';
import 'package:my_app/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final controller = Get.put(LoginController());
    var height = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
          Image(image: AssetImage(logo), height: height * 0.2),
          Text(tWelcomeBack),
          Text(tLoginSubtitle),


            Form(child: Container(padding: EdgeInsets.symmetric(vertical: 20.0),child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText : tEmail,
                  hintText : tEmail,
                  border: OutlineInputBorder()),
                  onChanged: (value) {
                    controller.updateEmail(value);
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
                    controller.updateEmail(value);
                            // print("The value entered is : $value");
                      }
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){showModalBottomSheet(context: context, builder: (conext)=>Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tForgotPassword),
                        Text(tForgotPasswordSubtitle),
                        const SizedBox(height: 30.0,),
                        GestureDetector(onTap : (){
                          Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordMailScreen()));
                                          }, child:Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade100),
                          child: Row(children: [
                            const Icon(Icons.mail_outline_rounded, size: 60.0,),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tEmail),
                                Text(tResetViaEmail)
                              ],
                            )

                          ]),
                        ))
                      ],),

                  ));}, child: const Text(tForgotPassword),),
                ),

                SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){
                  
                  // Navigator.push(context, MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         LandingPage()));
                      controller.loginClick();                    
                                          }, child: Text(tLogin.toUpperCase())))
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
                                          const SignUpScreen()));}, child: const Text.rich(TextSpan(text:tDontHaveAnAccount, children: [TextSpan(text: tSignUP, style: TextStyle(color: Colors.blue))])))
              ],
            )
          ],
        ),
    ),
      ),
    );
    
  }
}