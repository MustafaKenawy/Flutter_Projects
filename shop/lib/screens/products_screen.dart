// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:shop/Providers/cart.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/my_nav_bar.dart';
import 'package:shop/widgets/product_view.dart';
import '../Providers/products.dart';
import '../Providers/cart.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/screens/carts_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shop/widgets/nav2.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/products_screen';

  @override
  Widget build(BuildContext context) {
    Products provided = Provider.of<Products>(context);
    var products = provided.items;

    return Scaffold(
        appBar: AppBar(
          title: const Text('KinOO Store'),
          actions: [
            Badge(
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartsScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart_rounded),
              ),
              color: Theme.of(context).colorScheme.secondary,
              value: Provider.of<Carts>(context,listen:true).length.toString(),
            ),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 1)
                    provided.showAll();
                  else
                    provided.showFavonly();
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Favorites Only'),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: Text('All'),
                        value: 1,
                      ),
                    ])
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(7),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductView(
              id: products[index].id,
            );
          },
          itemCount: products.length,
        ),
    bottomNavigationBar: NAvBar2(),
    );
  }
}
