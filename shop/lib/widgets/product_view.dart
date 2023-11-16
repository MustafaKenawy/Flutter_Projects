// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/Providers/cart.dart';
import 'package:shop/screens/item_screen.dart';
import '../Providers/products.dart';
import 'package:provider/provider.dart';
class ProductView extends StatelessWidget {
  final String id;
  ProductView({
    required this.id,
  });



  @override
  Widget build(BuildContext context) {
    Products provided = Provider.of<Products>(context);
    var products = provided.items;
    var product = products.firstWhere((element) => element.id==id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_){
          return ItemScreen(id);})),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(product.title),
            leading: IconButton(
              onPressed: () {
                provided.toogleFavorite(product.id);
              }
              ,
              icon: Icon(
                product.isFavorite
                    ?
                Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: Consumer<Carts> ( builder:  (_,c,__) {
              return IconButton(
              onPressed: () {
                c.addCart(product.imageUrl, product.id, product.price,product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                  content: Text('Added item to Cart!', style: TextStyle(fontSize: 16),),
                  elevation: 8,
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO', onPressed: (){c.removeSingle(id);} ),
                ));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
              ),
            );},
          ),
        ),
      ),
    ));
  }
}
