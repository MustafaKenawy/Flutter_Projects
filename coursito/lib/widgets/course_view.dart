import '/screens/course_screen.dart';
import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  String id;
  String imgUrl;
  String owner;
  String name;
  String vidId;

  CourseView(
      {required this.name,
        required this.vidId,
        required this.owner,
        required this.imgUrl,
        required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Icon(Icons.school),
            title: Text(name),
            trailing: Text('By: $owner',style: TextStyle(color: Colors.pink,fontSize: 17),),
          ),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> CourseScreen(id: id)));
      },
    );
  }
}
