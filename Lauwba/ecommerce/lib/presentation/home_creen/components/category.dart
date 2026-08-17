import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [
      Card(
        child: ListTile(
          leading: Icon(Icons.phone_android),
          title: Text("Smartphone"),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.headphones),
          title: Text("Accesories"),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.chair),
          title: Text("Furniture"),
        ),
      )
    ];
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 50),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(width:200,child: categories[index]);
        },
      ),
    );
  }
}