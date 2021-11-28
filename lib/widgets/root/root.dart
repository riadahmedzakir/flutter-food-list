// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './../food/food_details.dart';
import './../food/food_list.dart';
import './../home/home.dart';
import '../filters/filters.dart';
import './../../constants/food_dummy_data.dart';
import './../../models/food.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Food> _foodList = DUMMY_FOODS;
  List<Food> _favouriteFoods = [];

  void _setFilters(Map<String, bool> filter) {
    setState(() {
      _filter = filter;

      _foodList = DUMMY_FOODS.where((food) {
        if (_filter['gluten']! && !food.isGlutenFree) {
          return false;
        }

        if (_filter['lactose']! && !food.isLactoseFree) {
          return false;
        }

        if (_filter['vegan']! && !food.isVegan) {
          return false;
        }

        if (_filter['vegetarian']! && !food.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String id) {
    final existingIndex =
        _favouriteFoods.indexWhere((element) => element.id == id);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteFoods.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteFoods
            .add(DUMMY_FOODS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favouriteFoods.any((food) => food.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foods',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    button: TextStyle(color: Colors.white),
                  ))),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(_favouriteFoods),
        '/category-food': (context) => FoodList(_foodList),
        '/food-details': (context) =>
            FoodDetails(_toggleFavourite, _isFavorite),
        '/settings': (context) => Filters(_filter, _setFilters)
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => Home(_favouriteFoods)),
    );
  }
}
