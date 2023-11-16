import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/order.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/nav2.dart';
import 'package:shop/widgets/order_view.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const  routeName = '/orders_screen';

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Orders>(context);
    var orders = provided.orders;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: Column(
        children: orders
            .map((e) => OrderView(date: e.date, amount: e.amount))
            .toList(),
      ),
      bottomNavigationBar: NAvBar2(),
    );
  }
}
