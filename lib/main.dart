import 'package:flutter/material.dart';
import 'package:iship/Screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Iship ',
      home: Screen1(),
      routes: {},
    );
  }
}
