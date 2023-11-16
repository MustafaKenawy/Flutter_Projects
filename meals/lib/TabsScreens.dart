// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meals/Categories_Screen.dart';
import 'package:meals/FavoritesScreen.dart';
import 'package:meals/MyDrawer.dart';
import 'models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> fav;
  TabsScreen(this.fav);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Map<String, Object>> screens=[];
  @override
  void initState() {
    screens = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.fav), 'title': 'Favorites'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[_selectedIndex]['title'] as String),
      ),
      drawer: MyDrawer(),
      body: screens[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        onTap: _selected,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
