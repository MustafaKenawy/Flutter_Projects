// ignore_for_file: file_names
import 'models/meal.dart';
import 'package:flutter/material.dart';
import 'package:meals/Meal_Item.dart';
import 'data.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;
  List<Meal> filtered ;
   CategoryMealScreen(this.filtered);
  static const routeName = '/CategoryMealScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var title = args['title'];
    var id = args['id'];
    var catMeals = filtered.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
            child: MealItem(
              url: catMeals[index].imageUrl,
              title: catMeals[index].title,
              duration: catMeals[index].duration,
              complexity: catMeals[index].complexity,
              affordability: catMeals[index].affordability,
              id: catMeals[index].id,
            ),
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
