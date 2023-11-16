// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/cart.dart';

class CartView extends StatelessWidget {
  String imgurl;
  String title;
  double price;
  String productId;
  int quantity;

  CartView(
      {required this.quantity,
      required this.title,
      required this.price,
      required this.imgurl,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) => showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              // contentPadding: EdgeInsets.only(top: 10.0),
              title: Text(
                'Are You Sure ?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              content: Text(
                'Really wanna remove it !!!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: Text('Yes',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text('No',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ),
              ],
            );
          }),
      key: ValueKey(productId),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (direction) {
        Provider.of<Carts>(context, listen: false).remove(productId);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgurl),
          radius: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(price.toStringAsFixed(2)),
        trailing: Text(
          'x$quantity',
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
