import 'package:app_starter1/notification_screen.dart';
import 'package:app_starter1/subscreeen/account_subscreen.dart';
import 'package:app_starter1/subscreeen/home_subscreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> subscreen = [
    HomeSubscreen(),
    Center(
      child: Text("Gallery"),
    ),
    Center(
      child: Text("Account"),
    ),
    AccountSubscreen(),
  ];

  int pageNow = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplikasi pertama Flutter Deny"),
        actions: [
          IconButton(onPressed: (){
            // push = menambahkan tumpukan
            // pop = mengurangi tumpukan
            // pushReplacement = menghapus tumpukan sebelumnya dan menambahakn halaman baru
            // popUntil = menghapus tumpukan sampai ke halaman tertentu
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()),
            );
          }, icon: Icon(Icons.notifications_active_outlined))
      ],),
      body: subscreen[pageNow],
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), // menetukan rounded
            topRight: Radius.circular(10),
          )
        ),
        // membuat child widget bersusun secara horizontal
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavItem(title: 'Home', icon: Icons.home, onTap: () {
              setState(() {
                pageNow = 0;
              });
            },),
            NavItem(title: 'Destination', icon: Icons.place_sharp, onTap: () {
              setState(() {
                pageNow = 1;
              });
            },),
            NavItem(title: 'Gallery', icon: Icons.collections, onTap: () {
              setState(() {
                pageNow = 2;
              });
            },),
            NavItem(title: 'Account', icon: Icons.person, onTap: () {
              setState(() {
                pageNow = 3;
              });
            },)
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const NavItem({
    super.key, required this.title, required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // memberikan efek tap pada widget column
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          Text(title, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}

