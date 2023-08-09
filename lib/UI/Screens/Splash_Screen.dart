import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/Data/Models/auth_Utils.dart';
import 'package:task_manager/UI/Screens/auth/LogIn_Screen.dart';
import 'package:task_manager/UI/Screens/bottom_Navigation_Screen.dart';
import 'package:task_manager/UI/Utils/assetUtilitis.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatorInLogIn();
  }

  Future<void> navigatorInLogIn() async {
    final bool isLoggedIn = await AuthActivity.checkUserInfoLogin();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? const BottomNavigationScreen() : const LogInScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            AssetUtils.background,
            fit: BoxFit.fill,
          ),
        ),
        Center(
            child: SvgPicture.asset(
          AssetUtils.logo,
          width: 100,
          fit: BoxFit.scaleDown,
        ))
      ]),
    );
  }
}
