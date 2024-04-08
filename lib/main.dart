import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:myfitness_app/pages/dashboard.dart';
=======
import 'package:myfitness_app/pages/home.dart';
>>>>>>> b1a2e30829896f125b38f607473ac3fb635a5272
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
<<<<<<< HEAD
      home:  HomePage()
=======
      home: HomePage()
>>>>>>> b1a2e30829896f125b38f607473ac3fb635a5272
    );
  }
}


