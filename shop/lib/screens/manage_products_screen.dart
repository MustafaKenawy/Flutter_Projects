// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/screens/editing_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/products.dart';
import 'package:shop/samples/product.dart';
import 'package:shop/widgets/manage_product_view.dart';
import 'package:shop/widgets/nav2.dart';

class ManageProducts extends StatelessWidget {
  static const routeName = '/manageScreen';

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Products>(context);
    List<Product> products = provided.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
              onPressed:() =>  Navigator.pushNamed(context, Editing.routeName,arguments:''),
              icon: Icon(
                Icons.add,
                size: 30,
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: products
                .map((e) => ManageView(
                    productId: e.id, title: e.title, imgurl: e.imageUrl))
                .toList(),
          ),
        ),
      ]),
      bottomNavigationBar: NAvBar2(),
    );
  }
}
