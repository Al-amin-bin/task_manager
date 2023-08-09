import 'package:flutter/material.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';
import 'package:task_manager/UI/Wigets/user_profile_banner.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ScreenBackground(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserProfileBanner(),
                    const SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Update Profile",
                            style: Theme.of(context).textTheme.titleLarge,),
                          const SizedBox(height: 16,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",

                            ),
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "First Name",

                            ),
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Last Name",

                            ),
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Mobile",

                            ),
                          ),
                          const SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Password",

                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){},

                                child: const Icon(Icons.arrow_forward_ios_outlined)),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              )),

    ));
  }
}
