
import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/image_strings.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:my_app/src/features/authentication/screens/forgot_password/forgot_password_otp.dart';

class ForgotPasswordMailScreen extends StatelessWidget{
  const ForgotPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(

        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(children: [
          SizedBox(height:  tDefaultSize*4,),
           Image(image: AssetImage(welcomeScreenImage2), height: height * 0.2),
          Text(tForgotPassword),
          Text(tForgotPasswordScreenSubtitle),

           SizedBox(height: 30),

           Form(child: Container(padding: EdgeInsets.symmetric(vertical: 20.0),child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.mail),
                  labelText : tEmail,
                  hintText : tEmail,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: null,icon:Icon(Icons.remove_red_eye_sharp)))
                ),
                

                SizedBox(width:double.infinity, child:ElevatedButton(onPressed: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OTPScreen()),
                                );}, child: Text(tNext)))])))
        
        ]),
      ),
    );
  }
}