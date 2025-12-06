import 'package:firebase_learning/features/dashboard/views/homepage.dart';
import 'package:firebase_learning/features/profile/views/profile_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [Homepage(), ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {}); 
        },
        items: [
          BottomNavigationBarItem(
            label: "Anasayfa",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
