import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../homePage/home.dart';


class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.only(right: 8),
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(10),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);

    
   // final Size size=MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Column(
                children: [
                  sizedH30,
                  Text("OTP Verification",style:TextStyle(color: textwhite,fontSize: 25,fontWeight: FontWeight.bold) ,)
                ],
              ),
                Lottie.asset('assets/animation/lottie_login.json',repeat: false),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('We will send you one time password to this \n email address.',textAlign: TextAlign.center,style: TextStyle(color: Colors.white70),),
                ),
              const  Text('(example123@gmail.com)',style: TextStyle(color: Colors.white70),),
               sizedH10,
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Pinput(
  defaultPinTheme: defaultPinTheme,
  focusedPinTheme: focusedPinTheme,
  submittedPinTheme: submittedPinTheme,
  validator: (s) {
    return s == '2222' ? null : 'Pin is incorrect';
  },
  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  showCursor: true,
  onCompleted: (pin) => print(pin),
),
                  ],
                 ),
               ),
               SizedBox(
                height: 45,
                width: size.width *0.9,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),));
                }, child: Text('Verify',style: TextStyle(color: textwhite),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)
                  )
                ),
                )
                
                )
            ],
          ),
        ),
      ),
    );
  }
}