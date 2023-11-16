import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  String _message;
  bool _isMe;
  String userName;
  String imgUrl;

  MessageBubble(this._message, this._isMe, this.userName, this.imgUrl,{required this.key});
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          mainAxisAlignment:
              _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if(!_isMe)
              CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
                radius: 25,
              ),
            Container(
              width: 180,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 2,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: _isMe
                    ? Colors.grey[350]
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: !_isMe ? Radius.zero : Radius.circular(10),
                  bottomRight: _isMe ? Radius.zero : Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: _isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    textAlign: _isMe ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _isMe ? Colors.black : Colors.orangeAccent,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    _message,
                    style: TextStyle(
                      color: _isMe ? Colors.black : Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if(_isMe)
            CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              radius: 25,
            ),
          ]),
    );
  }
}
