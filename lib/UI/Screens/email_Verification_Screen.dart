

import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/auth/Otp_Verification_Screen.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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
                Text("Your Email Address",
                  style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                Text("A 6 digits pin will sent to your email address",
                  style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 15,),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                ),
                const SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen()));
                  },

                      child: const Icon(Icons.arrow_forward_ios_outlined)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(" Have an account?", style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: .5),),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
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
