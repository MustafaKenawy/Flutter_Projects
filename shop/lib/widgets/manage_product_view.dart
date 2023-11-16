import 'package:flutter/material.dart';
import 'package:shop/screens/editing_screen.dart';
import 'package:shop/samples/product.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/products.dart';

class ManageView extends StatelessWidget {
  String imgurl;
  String title;
  String productId;

  ManageView(
      {required this.productId, required this.title, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Products>(context, listen: false);
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(children: [
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imgurl),
              radius: 30,
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(''),
            trailing: IconButton(
                onPressed: () => Navigator.pushNamed(context, Editing.routeName,
                    arguments: productId),
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
        ),
        IconButton(
            onPressed: () => provided.removeProduct(productId),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            )),
      ]),
    );
  }
}
