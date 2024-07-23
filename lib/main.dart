import 'package:flutter/material.dart';
import 'package:iship/Screens/dashboard.dart';

void main() {
  runApp(const UserAPTLogic());
}

class UserAPTLogic extends StatelessWidget {
  const UserAPTLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Iship ',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: {},
    );
  }
}
