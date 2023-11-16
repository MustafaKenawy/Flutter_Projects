// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:meals/CategoryMeal_Screen.dart';
import 'package:meals/MealDetails.dart';
import 'package:meals/data.dart';
import 'TabsScreens.dart';
import 'CategoryMeal_Screen.dart';
import 'package:meals/Filters.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, bool>> filters = [
    {'gluten': false},
    {'vegan': false},
    {'vegetarian': false},
    {'lactose': false},
  ];
  List<bool> filt = [
    false,
    false,
    false,
    false,
  ];
  List<Meal> favouriteMeals = [];
  List<Meal> filteredMeals = DUMMY_MEALS;
  bool isFavourite(String mealId){
    return favouriteMeals.any((element) => element.id == mealId );
}
  void _toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0)
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    else
      setState(() {
        favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  void _setFilters(List<Map<String, bool>> newFilter) {
    setState(() {
      filters = newFilter;
      filt = [
        newFilter[0]['gluten'] as bool,
        newFilter[1]['vegan'] as bool,
        newFilter[2]['vegetarian'] as bool,
        newFilter[3]['lactose'] as bool,
      ];
      filteredMeals = DUMMY_MEALS.where((meal) {
        if (filters[0]['gluten'] as bool && !meal.isGlutenFree) return false;
        if (filters[1]['vegan'] as bool && !meal.isGlutenFree) return false;
        if (filters[2]['vegetarian'] as bool && !meal.isGlutenFree)
          return false;
        if (filters[3]['lactose'] as bool && !meal.isGlutenFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              fontSize: 22,
            ),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            subtitle1: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
            )),
      ),
      home:  TabsScreen(favouriteMeals),
      routes: {
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(filteredMeals),
        MealDetails.routeName: (ctx) => MealDetails(_toggleFavourite,isFavourite),
        Filters.routeName: (ctx) => Filters(_setFilters, filt),
      },
    );
  }
}
