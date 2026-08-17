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
        appBar: AppBar(title: Text("Latihan Stack dan Align")),
        body: Stack(
          children: <Widget>[
            // Background
            Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(flex: 1, child: Container(color: Colors.white)),
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.black12),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(color: Colors.black12),
                      ),
                      Flexible(flex: 1, child: Container(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            //Listview dengan text
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Ini adalah text yang ada di lapisan tengah dari Stack.",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Button di tengah bawah
            Align(
              alignment: Alignment(0.9, 0.9),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("My Button"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
