

// ignore_for_file: prefer_const_constructors
import 'package:meals/Filters.dart';
import 'package:flutter/material.dart';
// ignore_for_file: file_names

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            height: 150,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.center,
            child: Text('Yummy !',style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 50,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),) ,
          ),
          SizedBox(height: 50,),
          ListTile(
            leading: Icon(Icons.restaurant,size: 28,),
            title: Text('Categories',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed'
            ),),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 28,),
            title: Text('Filters',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed'
            ),),
            onTap: (){
              Navigator.pushNamed(context, Filters.routeName);
            },
          ),


        ],
      ),
    );
  }
}
