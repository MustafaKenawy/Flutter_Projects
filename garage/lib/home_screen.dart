import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  void _logout(){
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text('Smart Garage'),actions: [IconButton(onPressed: _logout, icon: const Icon(Icons.logout))],),
      body:
         Center(child: ElevatedButton(onPressed: _logout, child:Text('LogOut')))
    );
  }
}
