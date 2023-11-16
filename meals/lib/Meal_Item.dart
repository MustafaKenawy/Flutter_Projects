// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/services.dart';
import 'package:meals/MealDetails.dart';

import 'models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  MealItem(
      {required this.url,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id});
  String url;
  String title;
  int duration;
  String id;
  Affordability affordability;
  Complexity complexity;
  String get Complexitytext {
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'UNKNOWN';
    }
  }
  String get Affordabilitytext{
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Unknown';
    }
  }

  mealItem (BuildContext context){
    Navigator.of(context).pushNamed(MealDetails.routeName,arguments: {
      'id' : id,
    } );

  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => mealItem(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(url),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 100,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  Icon(Icons.access_time),
                  Text('$duration min'),
                ]),
                Row(
                  children: [
                    Icon(Icons.work),
                    Text(Complexitytext),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    Text(Affordabilitytext),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
