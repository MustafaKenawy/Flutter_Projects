// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop/screens/manage_products_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('KinOO Store'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Icon(
                  Icons.home,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, ProductsScreen.routeName),
                    child: (Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )))
              ]),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Icon(
                  Icons.card_travel,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed:  () => Navigator.pushReplacementNamed(
                        context, OrdersScreen.routeName),
                    child: (Text(
                      'Orders',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )))
              ]),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Icon(
                  Icons.edit,
                  size: 30,
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed:  () => Navigator.pushReplacementNamed(
                        context, ManageProducts.routeName),
                    child: (Text(
                      'Manage Products',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
