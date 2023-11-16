// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/order.dart';
import 'package:shop/Providers/cart.dart';
import 'package:shop/widgets/cart_view.dart';

class CartsScreen extends StatelessWidget {
  static const routeName = '/cartsScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Carts>(context);
    var provider2 = Provider.of<Orders>(context, listen: false);
    List<Cart> carts = provider.carts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Carts'),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            margin: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 8,
            ),
            elevation: 10,
            child: ListTile(
              leading: Chip(
                padding: EdgeInsets.all(8),
                label: const Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              title: Text(provider.total.toStringAsFixed(2)),
              trailing: TextButton(
                child: Text(
                  'Order Now',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20),
                ),
                onPressed: () {
                  if (carts.length != 0) {
                    provider2.placeOrder(provider.total, carts);
                    provider.clear();
                  }
                },
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: carts
                .map((e) => CartView(
                    productId: e.productId,
                    quantity: e.quantity,
                    title: e.title,
                    price: e.price,
                    imgurl: e.imgUrl))
                .toList(),
          ))
        ],
      ),
    );
  }
}
