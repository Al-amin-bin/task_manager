import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/auth/LogIn_Screen.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                Text("Set Password",
                  style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                Text("Minimum password should be 8 letters with numbers & symbols",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey), ),
                const SizedBox(height: 15,),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "password"
                  ),
                ),
                const SizedBox(height: 15,),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Confirm Password"
                  ),
                ),
                const SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LogInScreen()), (route) => false);

                  },

                      child: const Text("Confirm")),
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
