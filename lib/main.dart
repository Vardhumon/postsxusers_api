import 'package:flutter/material.dart';
import 'package:users_api/Screens/Landing.dart';
import 'package:users_api/Screens/newLand.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true
      ),
      home: LandingPage(),
      );
  }
}