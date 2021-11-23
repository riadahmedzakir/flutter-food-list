import 'package:flutter/material.dart';

import 'package:flutter_food_list/models/food.dart';
import 'package:flutter_food_list/widgets/food/food_item.dart';

class FoodList extends StatelessWidget {
  final List<Food> _foodlist;

  FoodList(this._foodlist);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final foodList = _foodlist
        .where((food) => food.categories.contains(routeArgs['id']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'] as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodItem(foodList[index]);
        },
        itemCount: foodList.length,
      ),
    );
  }
}
