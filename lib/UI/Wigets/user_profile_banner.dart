import 'package:flutter/material.dart';
import 'package:task_manager/Data/Models/auth_Utils.dart';
import 'package:task_manager/UI/Screens/Update_Profile_Screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfileScreen()));
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage("https://images.pexels.com/photos/572897/pexels-photo-572897.jpeg"),
        radius: 16,
      ),
      title:  Text('${AuthActivity.useInfo.data?.firstName ?? ''} ${AuthActivity.useInfo.data?.lastName ?? ''}', style: TextStyle( fontSize: 14,color: Colors.white),),
      subtitle:  Text(AuthActivity.useInfo.data?.email ?? 'Unknown',
        style: const TextStyle(fontSize: 12, color: Colors.white),),
    );
  }
}