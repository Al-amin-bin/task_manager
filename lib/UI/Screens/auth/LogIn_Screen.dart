
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Models/auth_Utils.dart';
import 'package:task_manager/Data/Models/login_Model.dart';
import 'package:task_manager/Data/Models/network_responce.dart';
import 'package:task_manager/Data/Survices/Network_Caller.dart';
import 'package:task_manager/Data/Utilitis/Urls.dart';
import 'package:task_manager/UI/Screens/auth/Sign_Up_Screen.dart';
import 'package:task_manager/UI/Screens/bottom_Navigation_Screen.dart';
import 'package:task_manager/UI/Screens/email_Verification_Screen.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _inProgress = false;

  Future<void> login() async {
    _inProgress = true;
    if(mounted){
      setState(() {
      });
    }
    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, requestBody);
    _inProgress = false;
    if(mounted){
      setState(() {
      });
    }
    if (response.success) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthActivity.saveUserInfo(model);

      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationScreen()),
            (route) => false);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("inCorrect Email No or Password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Text(
                  "Get Started With",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Your Email ID";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordTEController,
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 8) {
                      return "Enter the vaild password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "password",
                      suffixIcon: Icon(Icons.remove_red_eye)),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _inProgress == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                        onPressed: () {
                          if(!_formState.currentState!.validate()){
                            return;
                          }
                          login();
                        },
                        child: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerificationScreen()));
                      },
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: .5),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("Sign Up")),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
