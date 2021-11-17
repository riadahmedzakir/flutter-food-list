import 'package:flutter/material.dart';
import 'package:flutter_food_list/constants/dummy_data.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
          children: <Widget>[
            ...DUMMY_CATEGORIES
                .map((data) => CategoryItem(data.title, data.color))
          ],
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
