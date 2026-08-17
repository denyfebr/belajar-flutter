import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left, size: 30)),
        title: Text("Notification List"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // membuat lingkaran
                  border: Border.all(color: Colors.blue, width: 1), // lingkaran dengan garis outline warna biru
                ),
                child: Icon(Icons.notifications),
              ),
              title: Text("Notification $index"),
              trailing: Icon(Icons.chevron_right),
            ),
          )            
      ),
    );
  }
  
  
}