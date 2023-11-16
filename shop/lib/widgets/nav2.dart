// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shop/screens/manage_products_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/products_screen.dart';

class NAvBar2 extends StatefulWidget {
  const NAvBar2({Key? key}) : super(key: key);

  @override
  _NAvBar2State createState() => _NAvBar2State();
}
int _index =0;

class _NAvBar2State extends State<NAvBar2> {

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      currentIndex: _index,
      onTap: (int val) {
        setState(() => _index = val);
        if(val == 0 )
          Navigator.pushReplacementNamed(context, ProductsScreen.routeName);
        else if (val == 1)
          Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
        else if (val == 2)
          Navigator.pushReplacementNamed(context, ManageProducts.routeName);
      },
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(icon: Icons.card_travel, title: 'Orders'),
        FloatingNavbarItem(icon: Icons.edit, title: 'Manage Products'),
      ],
    );
  }
}
