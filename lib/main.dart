import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tudo_app/constants/color.dart';
import 'package:tudo_app/screens/home.dart';
import 'package:tudo_app/Widgets/todo_item.dart';
void main() {
  // Set Status Bar Color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: tdBGColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: tdBGColor,
      ),
      home: const Home(),
    );
  }
}
