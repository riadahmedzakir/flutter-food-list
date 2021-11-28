import 'package:flutter/material.dart';
import 'package:flutter_food_list/models/food.dart';

import './../../widgets/categories/category_list.dart';
import './../../widgets/favorites/favorites.dart';
import 'custom_drawer.dart';

class Tabs extends StatefulWidget {
  final List<Food> _favouriteFoods;
  Tabs(this._favouriteFoods);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late List<Widget> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      CategoryList(),
      Favourite(widget._favouriteFoods),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chef in Training'),
        ),
        drawer: CustomDrawer(),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blue[900],
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
