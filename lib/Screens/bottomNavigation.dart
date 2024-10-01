import 'package:flutter/material.dart';
import 'package:machinetest/Screens/productDetails_Screen.dart';

import '../constants/colors.dart';
import 'homeScreen.dart';
class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int selectedIndex = 0;

  List<Widget> getScreens() {
    return [
      Homescreen(),
      ProductdetailsScreen(),

    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screens = getScreens();
    return Scaffold(

      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
                backgroundColor:Colors.white
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          selectedItemColor: pink,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}