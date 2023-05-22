import 'package:flutter/material.dart';
import 'package:my_app/src/features/authentication/constants/sizes.dart';
import 'package:my_app/src/features/authentication/constants/text_strings.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget{
  const OTPScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container(padding: EdgeInsets.all(tDefaultSize),
    
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(tOTPTitle, style: TextStyle(
                          
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 80),),
        Text(tOTPSubtitle),
        SizedBox(height: 40.0,),
        Text("Enter the verification code sent to your mail"),
        SizedBox(height: 20.0),
        OtpTextField(
          numberOfFields: 6,
          fillColor : Colors.black.withOpacity(0.1),
          filled  : true,
          onSubmit:(value) {
            
          },
        ),
        SizedBox(height: 40.0,),
        SizedBox(
          width : double.infinity,
        child: ElevatedButton(onPressed: (){}, child: Text(tNext)))
      ],
    ),),);
  }
}