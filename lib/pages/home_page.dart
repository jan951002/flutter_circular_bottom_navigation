import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import 'display_container.dart';
import 'list_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DisplayContainer(Center(child: Icon(Icons.home))),
    DisplayContainer(SearchPage()),
    DisplayContainer(ListPage()),
    DisplayContainer(ProfilePage())
  ];
  
  List<String> titles = [
    'Home',
    'Search',
    'List',
    'Profile',
  ];

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue),
    new TabItem(Icons.search, "Search", Colors.orange),
    new TabItem(Icons.list, "List", Colors.red),
    new TabItem(Icons.account_circle, "Profile", Colors.cyan),
  ]);
  CircularBottomNavigationController navigationController;

  _HomeState(){
    navigationController = CircularBottomNavigationController(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        selectedCallback: _onTabTapped,
        controller: navigationController,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
