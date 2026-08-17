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
  String message = "Ini adalah text";
  // void changeText(){
  //   setState(() {
  //     message = "Tombol sudah ditekan";
  //   });
  // }
  //
  // void resetText(){
  //   setState(() {
  //     message = "Ini adalah text";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Anonymous Method")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(message),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () { // ini adalah anonymous method
                      setState(() {
                        message = "Tombol sudah ditekan";
                      });
                    },
                    child: Text("Tekan Saya"),
                  ),
                  ElevatedButton(
                      onPressed: (){ // ini adalah anonymous method
                        setState(() {
                          message = "Ini adalah text";
                        });
                      },
                      child: Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
