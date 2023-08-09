import 'package:flutter/material.dart';
import 'package:task_manager/Data/Models/network_responce.dart';
import 'package:task_manager/Data/Survices/Network_Caller.dart';
import 'package:task_manager/Data/Utilitis/Urls.dart';
import 'package:task_manager/UI/Wigets/screen_background.dart';
import 'package:task_manager/UI/Wigets/user_profile_banner.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {


  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _decTEController = TextEditingController();
  final GlobalKey<FormState> _keyValue = GlobalKey<FormState>();
  bool _adNewTaskInProgress = false;

  Future<void> addNewTask() async {
    _adNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _decTEController.text.trim(),
      "status": "New"
    };
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _adNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.success) {
      _titleTEController.clear();
      _decTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task added successfully')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task add failed!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserProfileBanner(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _keyValue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add New Task",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge,),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _titleTEController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "title",

                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Please Enter a title";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: _decTEController,
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Description",

                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "Please Enter a Description";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          if (!_keyValue.currentState!.validate()) {
                            return;
                          }
                          addNewTask();

                        },

                            child: const Icon(
                                Icons.arrow_forward_ios_outlined)),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}





