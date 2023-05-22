
import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Image(image: AssetImage(welcomeScreenImage2), height: height * 0.2),
          Text(tWelcomeBack),
          Text(tLoginSubtitle),


            Form(child: Container(padding: EdgeInsets.symmetric(vertical: 20.0),child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText : tEmail,
                  hintText : tEmail,
                  border: OutlineInputBorder())
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.fingerprint),
                  labelText : tPassword,
                  hintText : tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: null,icon:Icon(Icons.remove_red_eye_sharp)))
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: const Text(tForgotPassword),),
                ),

                SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){}, child: Text(tLogin.toUpperCase())))
              ],
            )
            )
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("OR"),
                
                SizedBox(width:double.infinity ,child:OutlinedButton.icon(icon : Image(image: AssetImage(googleLogoImage),width: 20.0,),onPressed: (){}, label: Text(tSignInWithGoogle))),

                TextButton(onPressed: (){}, child: const Text.rich(TextSpan(text:tDontHaveAnAccount, children: [TextSpan(text: tSignUP, style: TextStyle(color: Colors.blue))])))
              ],
            )
          ],
        ),
    ),
      ),
    );
    
  }
}