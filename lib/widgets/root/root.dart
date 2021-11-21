// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './../food/food_details.dart';
import './../food/food_list.dart';
import './../home/home.dart';
import './../settings/settings.dart';

class Root extends StatelessWidget {
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
        '/': (context) => Home(),
        '/category-food': (context) => FoodList(),
        '/food-details': (context) => FoodDetails(),
        '/settings': (context) => Settings()
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (ctx) => Home()),
    );
  }
}
