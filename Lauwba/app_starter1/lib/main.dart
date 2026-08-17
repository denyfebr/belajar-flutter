import 'package:app_starter1/splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';


main() {
  runApp(MyApp()); //menjalankan aplikasinya
}

//stless = stateless widget
//stful = stateful widget
// ctrl + Alt + L = format document

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Pertama Saya",
      theme: ThemeData(primaryColor: Colors.red),
      home: SplashScreen(),
    );
  }
}


