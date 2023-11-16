// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'data.dart';
import './models/meal.dart';

class MealDetails extends StatelessWidget {
  static const routeName = './Meal-Details';
    Function toggle;
    Function isFavourite;
   MealDetails(this.toggle,this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String id = args['id'] as String;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    int indx = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Container(
              child: Column(
                  children: selectedMeal.ingredients.map((element) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.topLeft,
                  child: Card(
                    child: Text(
                      element,
                      style: TextStyle(fontSize: 20),
                    ),
                    elevation: 4,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                );
              }).toList()),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              // height: 400,
              child: Column(
                  children: selectedMeal.steps.map((element) {
                indx++;
                return Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Card(
                          color: Theme.of(context).secondaryHeaderColor,
                          elevation: 4,
                          child: Text(
                            '$indx- $element',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        )),
                    //SizedBox(height: 5),
                    Divider(),
                  ],
                );
              }).toList()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggle(id) ,
        child:!isFavourite(id)?
        Icon(Icons.star_border,size: 27,color: Colors.black,) :Icon(Icons.star,size: 27,color: Colors.black,),
      ),
    );
  }
}
