import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/Update_Task.dart';
import 'package:task_manager/UI/Wigets/SummryCard.dart';
import 'package:task_manager/UI/Wigets/task_List_Tile.dart';
import 'package:task_manager/UI/Wigets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
           const Padding(
             padding: EdgeInsets.all(8.0),
             child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "new",
                      number: 122,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "progress",
                      number: 82,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Cancel",
                      number: 62,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: "Completed",
                      number: 90,
                    ),
                  ),
                ],
              ),
           ),
            Expanded(child:
            ListView.separated(
              itemCount: 20,
                itemBuilder: (context, index){
                return TaskListTile();

            }, separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 4,);
            },)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}






