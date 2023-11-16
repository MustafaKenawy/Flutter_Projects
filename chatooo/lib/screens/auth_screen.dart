import 'dart:io';

import 'package:chatooo/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// ignore_for_file: prefer_const_constructors

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }


  init() async{
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('The FCM TOKEN !!!############');
    print(fcmToken);
    print('#######################################');
  }

  late File imageFile;
  var imgy;
  void imgpick(File img) {
    imageFile = img;
    imgy = Image.file(imageFile).image;
  }

  bool _isLoading = false;
  void submitAuth(String userName, String password, String email, bool isLogin,
      BuildContext ctx) async {
    final _auth = FirebaseAuth.instance;
    var url;
    try {
      if (isLogin) {
          setState(() {
            _isLoading = true;
          });
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        if (imgy == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please pick an image !!'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          return;
        }
        setState(() {
          _isLoading = true;
        });
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final reff = FirebaseStorage.instance
            .ref().child('images')
            .child('${_auth.currentUser?.uid}.jpg');
        await reff.putFile(imageFile).whenComplete(() => null);
        url = await reff.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .set({
          'email': email,
          'userName': userName,
          'password': password,
          'image_url': url,
        });

      }


    } on FirebaseAuthException catch (err) {
      setState(() {
        _isLoading = false;
      });
      var message = 'An error occurred ,please check your data';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        backgroundColor: Theme.of(ctx).colorScheme.error,
      ));
    } catch (err) {
      setState(() {
        print(err);
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(submitAuth, _isLoading, imgpick),
    );
  }
}
