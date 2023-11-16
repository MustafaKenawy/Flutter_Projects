// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'package:meals/Meal_Item.dart';

class FavoritesScreen extends StatelessWidget {

  List<Meal> favouriteMeals;
  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return (favouriteMeals.isEmpty)? const Center(
      child: Text('No Favourite meals!!! -- Start adding some!'),
    ): ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
          child: MealItem(
            url: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            id: favouriteMeals[index].id,
          ),
        );
      },
      itemCount: favouriteMeals.length,
    );
  }
}
