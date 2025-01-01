import 'package:flutter/material.dart';
import 'package:ui_challenge5/screens/home.dart';
import 'package:ui_challenge5/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: AppColor.white,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
