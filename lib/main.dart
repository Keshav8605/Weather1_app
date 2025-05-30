import 'package:flutter/material.dart';
import 'home_screen.dart';

import 'Details_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(), // Initial screen
    );
  }
}
