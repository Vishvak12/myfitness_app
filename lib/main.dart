import 'package:flutter/material.dart';
import 'package:myfitness_app/pages/home.dart';
//HELLO THIS IS A COMMENT
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( fontFamily: 'Poppins'),
      home: HomePage()
    );
  }
}


