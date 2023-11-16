import 'package:chatooo/chats/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('stamp', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data?.docs.length,
            itemBuilder: (ctx, index) {
              var uid = FirebaseAuth.instance.currentUser?.uid;
              return MessageBubble(
                chatSnapshot.data?.docs[index]['text'],
                chatSnapshot.data?.docs[index]['userId'] == uid,
                chatSnapshot.data?.docs[index]['userName'],
                chatSnapshot.data?.docs[index]['user_image'],
                key: ValueKey(chatSnapshot.data?.docs[index]),
              );
            });
      },
    );
  }
}
