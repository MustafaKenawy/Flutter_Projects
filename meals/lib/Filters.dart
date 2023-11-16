// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  Function setFilters;
  List<bool> filter;
  Filters(this.setFilters, this.filter);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filter[0];
    _vegan = widget.filter[1];
    _vegetarian = widget.filter[2];
    _lactoseFree = widget.filter[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 40,
            width: double.infinity,
            child: Text(
              'Adjust your Meals ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
                title: Text('Gluten-Free'),
                subtitle: Text('Meals with no Gluten '),
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              SwitchListTile(
                value: _vegan,
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
                title: Text('Vegan'),
                subtitle: Text(' Vegan Meals'),
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              SwitchListTile(
                value: _vegetarian,
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
                title: Text('Vegetarian'),
                subtitle: Text('Vegetarian Meals '),
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              SwitchListTile(
                value: _lactoseFree,
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
                title: Text('Lactose-Free'),
                subtitle: Text('Meals with no Lactose '),
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          )),
          ElevatedButton(
              onPressed: () {
                widget.setFilters([
                  {'gluten': _glutenFree},
                  {'vegan': _vegan},
                  {'vegetarian': _vegetarian},
                  {'lactose': _lactoseFree},
                ]);
              },
              child: Icon(Icons.save))
        ],
      ),
    );
  }
}
