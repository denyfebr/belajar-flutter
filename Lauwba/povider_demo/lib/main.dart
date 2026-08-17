import 'package:flutter/material.dart';
import 'package:povider_demo/CounterProvider.dart';
import 'package:povider_demo/NewsProvider.dart';
import 'package:povider_demo/home_screen.dart';
import 'package:povider_demo/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (BuildContext context) => NewsProvider(),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const NewsListScreen(),
      ),
    );
  }
}
