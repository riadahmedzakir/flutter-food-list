import 'package:flutter/material.dart';
import 'package:flutter_food_list/models/food.dart';

import './../../widgets/navigations/tabs.dart';

class Home extends StatefulWidget {
  final List<Food> _favouriteFoods;
  Home(this._favouriteFoods);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Tabs(widget._favouriteFoods);
  }
}
