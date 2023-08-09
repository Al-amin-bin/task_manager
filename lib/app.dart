import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/Splash_Screen.dart';

class TaskApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskApp.globalKey,
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          focusColor: Colors.black,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 7),
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        textTheme: const TextTheme(
          titleLarge:
          TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,

          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7))
          )
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),

    );
  }
}
