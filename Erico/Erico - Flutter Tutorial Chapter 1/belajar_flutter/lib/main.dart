import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi Hello World"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            color: Colors.lightBlue,
            width: 150,
            height: 120,
            child: Text(
              "saya sedang melatih kemampuan flutter saya",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // softWrap: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
    );
  }
}
