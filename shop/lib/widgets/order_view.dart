// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/order.dart';

class OrderView extends StatefulWidget {
  double amount;
  DateTime date;

  OrderView({
    required this.date,
    required this.amount,
  });

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Orders>(context, listen: false);
    var ordersList = provided.orders;
    var order = ordersList.firstWhere((element) => element.date == widget.date);
    var carts = order.carts;
    return Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              title: Text('\$' + widget.amount.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 20,
                  )),
              subtitle: Text(
                DateFormat('dd/mm/yyyy     hh:mm').format(widget.date),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () {
                        provided.remove(order.date);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          _showMore ? Icons.expand_less : Icons.expand_more),
                      onPressed: () {
                        setState(() {
                          _showMore = !_showMore;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: _showMore ? carts.length * 60 : 5,
              child: _showMore
                  ? Expanded(
                      child: ListView(
                      children: carts
                          .map((e) => View(
                              title: e.title, price: e.price, url: e.imgUrl))
                          .toList(),
                    ))
                  : Container(),
            )
          ],
        ));
  }
}

class View extends StatelessWidget {
  View({
    required this.title,
    required this.price,
    required this.url,
  });

  String url;
  String title;
  double price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: 23,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 18,
          )),
      trailing: Text(
        '\$$price',
        style: TextStyle(
            fontSize: 17, color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
