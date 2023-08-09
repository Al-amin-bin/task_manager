import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/UI/Utils/assetUtilitis.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SvgPicture.asset(
        AssetUtils.background, fit: BoxFit.fill,),
    ),
        SafeArea(child: child)
    ]
    );
  }
}
