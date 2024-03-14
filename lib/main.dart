import 'package:flutter/material.dart';
import 'package:newjob/Home_Screen.dart';
import 'package:newjob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'CHECK24 Quiz',
      home: MainMenu(),
    );
  }
}





