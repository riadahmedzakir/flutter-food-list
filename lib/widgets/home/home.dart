import 'package:flutter/material.dart';
import 'package:flutter_food_list/widgets/categories/category_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CategoryList();
  }
}
