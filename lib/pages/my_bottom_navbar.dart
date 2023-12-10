import 'package:flutter/material.dart';
import 'package:onco_app/pages/home_page.dart';

class MyBottomNavbar extends StatefulWidget {
  const MyBottomNavbar({super.key});

  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  var currentIndex = 0;
  List<Widget> screen = [
    HomePage(),
    const Center(
      child: Text("......"),
    ),
    const Center(
      child: Text("......"),
    ),
    const Center(
      child: Text("......"),
    ),
    const Center(
      child: Text("......"),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screen[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_sharp),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.article_outlined),
            label: 'Articles',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
