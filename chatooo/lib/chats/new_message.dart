// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

var _message = '';

class _NewMessageState extends State<NewMessage> {
  var _controller = TextEditingController();
  void _submit() async{
    if (_message != ''){
      var userId = await FirebaseAuth.instance.currentUser!.uid;
      final userData = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      FirebaseFirestore.instance.collection('chat').add({
        'text': _message,
        'stamp': Timestamp.now(),
        'userId' :userId,
        'userName': userData['userName'],
        'user_image': userData['image_url'],
      });}
    _controller.clear();
    _message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _message = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Send a message...',
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: IconButton(
                onPressed: _message.trim().isEmpty ? null : _submit,
                icon: Icon(
                  Icons.send_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
