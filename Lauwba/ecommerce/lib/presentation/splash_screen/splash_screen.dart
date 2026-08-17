import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../home_creen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  goToHome()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  initPermission()async{

    // listen notifikasi pada saat apliaksi dibuka
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      if(message.notification != null){
        showDialog(context: context, builder: (_) => AlertDialog(
          title: Text(message.notification!.title!),
          content: Text(message.notification!.body!),
        ));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    goToHome();
    super.initState();
    initPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/img.png", width: 200),
              SizedBox(height: 20),
              Text("E Commerce", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        )
    );
  }
}