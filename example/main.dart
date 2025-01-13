import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:spotlight_bottom_navbar/spotlight_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SpotlightBottomNav(
        spotlightColor: Colors.yellow,
        bottomNavCount: 4,
        icons: const [
          IconlyLight.home,
          IconlyLight.category,
          IconlyLight.profile,
          IconlyLight.setting,
        ],
          pages: [
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Category Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Profile Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Settings Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}