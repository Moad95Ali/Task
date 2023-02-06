import 'package:flutter/material.dart';
import 'package:taskf/api/api.dart';
import 'package:taskf/detailsPage.dart';
import 'package:taskf/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: HomePage()),
    );
  }
}
