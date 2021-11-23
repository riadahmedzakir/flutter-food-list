import 'package:flutter/material.dart';
import './../../widgets/navigations/custom_drawer.dart';

class Filters extends StatefulWidget {
  final Function saveFilters;

  final Map<String, bool> _filter;

  Filters(this._filter, this.saveFilters);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(
      String title, String subtitle, bool value, Function onChangeHandler) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (newValue) => onChangeHandler(newValue),
    );
  }

  @override
  void initState() {
    _glutenFree = widget._filter['gluten']!;
    _vegetarian = widget._filter['vegetarian']!;
    _vegan = widget._filter['vegan']!;
    _lactoseFree = widget._filter['lactose']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () => widget.saveFilters({
              'gluten': _glutenFree,
              'lactose': _vegetarian,
              'vegan': _vegan,
              'vegetarian': _lactoseFree
            }),
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile(
                      'Gluten Free',
                      'Only include gluten free meals',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchTile(
                      'Lactose Free',
                      'Only include lactose free meals',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchTile(
                    'Vegetarian',
                    'Only include vagetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
