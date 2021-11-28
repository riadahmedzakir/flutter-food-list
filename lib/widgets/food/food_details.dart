import 'package:flutter/material.dart';
import './../../constants/food_dummy_data.dart';
import './../../models/food.dart';

class FoodDetails extends StatelessWidget {
  final Function _toggleFavourite;
  final Function _isFavorite;

  FoodDetails(this._toggleFavourite, this._isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final selectedFood =
        DUMMY_FOODS.where((element) => element.id == routeArgs['id']).first;

    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title'] as String),
        ),
        floatingActionButton: FloatingActionButton(
          child: _isFavorite(routeArgs['id'])
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            _toggleFavourite(routeArgs['id']);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedFood.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedFood.ingredients[index]),
                  ),
                ),
                itemCount: selectedFood.ingredients.length,
              )),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedFood.steps[index]),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedFood.steps.length,
                ),
              )
            ],
          ),
        ));
  }
}
