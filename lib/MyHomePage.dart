import 'package:flutter/material.dart';

import 'Home.dart';
import 'Reelspage.dart';
import 'Searchpage.dart';
import 'profilePage.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _SelectedIndex = 0;
  void _vigationbar(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }
  final List<Widget> _children = [
    Home(),
    searchpage(),
    Reelspage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_SelectedIndex], //
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        elevation: 0,
        currentIndex: _SelectedIndex,
        onTap: _vigationbar,
        type: BottomNavigationBarType.fixed,
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Reels"),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
