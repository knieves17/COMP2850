import "package:flutter/material.dart";
import 'pages/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
    );
  }
}

class Task {
  final String title;
  bool done;
  final String description;

  Task({required this.title, required this.done, required this.description});
}
