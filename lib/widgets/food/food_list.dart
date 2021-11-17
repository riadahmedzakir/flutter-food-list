import 'package:flutter/material.dart';
import 'package:flutter_food_list/widgets/food/food_item.dart';
import './../../constants/food_dummy_data.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final foodList = DUMMY_FOODS
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
