import 'package:flutter/material.dart';
import 'package:taskf/api/api.dart';
import 'package:taskf/detailsPage.dart';
import 'package:taskf/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: HomePage()),
    );
  }
}
