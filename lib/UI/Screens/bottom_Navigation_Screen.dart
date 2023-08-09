import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/Cancel_Task_Screen.dart';
import 'package:task_manager/UI/Screens/Completed_Task_Screen.dart';
import 'package:task_manager/UI/Screens/In_Progress_Screen.dart';
import 'package:task_manager/UI/Screens/New_Task_Screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedScreenIndex  = 0;
  final List<Widget> _screen = const[
    NewTaskScreen(),
    InProgressScreen(),
    CancelTaskScreen(),
    CompletedTaskScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
            color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        onTap: (int index){
          _selectedScreenIndex = index;
          if(mounted){
            setState(() {});
          }
      },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_card), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree_outlined), label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel"),
          BottomNavigationBarItem(icon: Icon(Icons.done_outline_outlined), label: "Completed"),
        ],
      ),
    );
  }
}
