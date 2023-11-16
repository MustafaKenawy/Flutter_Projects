// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';
import 'data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: DUMMY_CATEGORIES
          .map((item) => Category_item(item.title, item.color, item.id))
          .toList(),
    );
  }
}
