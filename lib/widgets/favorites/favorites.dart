import 'package:flutter/material.dart';
import 'package:flutter_food_list/models/food.dart';
import 'package:flutter_food_list/widgets/food/food_item.dart';

class Favourite extends StatelessWidget {
  final List<Food> _favoriteFoods;
  Favourite(this._favoriteFoods);

  @override
  Widget build(BuildContext context) {
    if (_favoriteFoods.isEmpty) {
      return const Center(
        child: Text('You have noe favourites yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodItem(_favoriteFoods[index]);
        },
        itemCount: _favoriteFoods.length,
      );
    }
  }
}
