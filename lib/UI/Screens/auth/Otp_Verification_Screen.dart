import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/UI/Screens/auth/LogIn_Screen.dart';
import 'package:task_manager/UI/Screens/auth/Reset_Password_Screen.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64,),
                Text("Pin Verification",
                  style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                Text("A 6 digits pin will sent to your email address",
                  style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 15,),

                 PinCodeTextField(
                   keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedColor: Colors.green,
                    inactiveColor:Colors.red,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,



                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  cursorColor: Colors.green,
                  enablePinAutofill: true,
                  enableActiveFill: true,


                  onCompleted: (v) {

                  },

                  beforeTextPaste: (text) {
                    return true;
                  }, appContext: context,
                ),
                const SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const ResetPasswordScreen()), (route) => false);
                  },

                      child: const Text("Verify")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(" Have an account?", style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: .5),),
                    TextButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LogInScreen()), (route) => false);
                    },
                        child: const Text("Sign In")),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
