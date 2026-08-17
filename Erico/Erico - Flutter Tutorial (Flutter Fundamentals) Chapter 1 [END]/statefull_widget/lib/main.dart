import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 10;
  void increasedNumber() {
    setState(() {
      number++;
    });
  }

  void resetNumber() {
    setState(() {
      number = 10;
    });
  }

  void decreasedNumber() {
    setState(() {
      if (number > 10){
        number--;
      }else{
        number = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Stateful Widget Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                number.toString(),
                style: TextStyle(fontSize: 10 + number.toDouble()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: decreasedNumber,
                    child: Text("-"),
                  ),
                  ElevatedButton(
                    onPressed: resetNumber,
                    child: Text("Reset"),
                  ),
                  ElevatedButton(
                    child: Text("+"),
                    onPressed: increasedNumber,
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
