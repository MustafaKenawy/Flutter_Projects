import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Providers/products.dart';

class ItemScreen extends StatelessWidget {

   final String id ;
   ItemScreen(@required this.id);

  static const routeName = '/ItemScreen';

  @override
  Widget build(BuildContext context) {

    Products provided = Provider.of<Products>(context);
    var products = provided.items;
    var product = products.firstWhere((element) => element.id==id);
    return Scaffold(
      appBar: AppBar(title: Text(product.title),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(product.imageUrl,fit: BoxFit.cover,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.title,style: TextStyle(fontSize: 30,color: Theme.of(context).colorScheme.secondary),),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(product.description,style: TextStyle(fontSize: 25),),
          ),

        ],
      ),

    );
  }
}
