import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/cart.dart';
import 'package:shop/Providers/order.dart';
import 'package:shop/Providers/products.dart';
import 'package:shop/screens/manage_products_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/screens/carts_screen.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:shop/screens/editing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return  MultiProvider(providers:
        [ChangeNotifierProvider(create: (_) {return Products();}),
          ChangeNotifierProvider(create: (_) {return Carts();}),
          ChangeNotifierProvider(create: (_) {return Orders();}),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        home: ProductsScreen(),
        routes: {
          ProductsScreen.routeName: (ctx) => ProductsScreen(),
          CartsScreen.routeName: (ctx) => CartsScreen(),
          OrdersScreen.routeName:(ctx) => OrdersScreen(),
          ManageProducts.routeName:(ctx) => ManageProducts(),
          Editing.routeName:(ctx) => Editing(),
        },
      ),
    );
  }
}
