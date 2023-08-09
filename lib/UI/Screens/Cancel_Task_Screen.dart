import 'package:flutter/material.dart';
import 'package:task_manager/UI/Wigets/task_List_Tile.dart';
import 'package:task_manager/UI/Wigets/user_profile_banner.dart';

class CancelTaskScreen extends StatelessWidget {
  const CancelTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Expanded(child:
            ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index){

              }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 4,);
            },)),
          ],
        ),
      ),
    );
  }
}
