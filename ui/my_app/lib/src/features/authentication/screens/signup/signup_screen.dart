
import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/dataCollection/dataCollection.dart';
import 'package:my_app/src/features/authentication/screens/login/login_screen.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);

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
          Text(tSignupTitle),
          Text(tSignupSubtitle),


            Form(child: Container(padding: EdgeInsets.symmetric(vertical: 20.0),child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText : tUserName,
                  hintText : tUserName,
                  border: OutlineInputBorder())
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.email),
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
                

                SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){

                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataCollection()));
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