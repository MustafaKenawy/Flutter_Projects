// ignore_for_file: prefer_final_fields
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Course {
  String id;
  String name;
  String owner;
  String vidCode;
  String imgUrl;
  int videoNum;
  List<Map<String, String>> addresses;

  Course({
    required this.name,
    required this.id,
    required this.imgUrl,
    required this.vidCode,
    required this.owner,
    required this.videoNum,
    required this.addresses,
  });
}

class Courses with ChangeNotifier {
  List<Course> _courses = [
    Course(
        name: 'Respiratory System',
        id: 'mkll',
        imgUrl:
            'https://cdn.pixabay.com/photo/2015/07/19/10/00/school-work-851328_960_720.jpg',
        vidCode: 'hyUJjb-uK0Y',
        owner: "M Barakat",
        videoNum: 2,
        addresses: [
          {
            'vidName': 'kk',
            'url': 'https://www.youtube.com/watch?v=hyUJjb-uK0Y'
          },
          {
            'vidName': 'kk',
            'url': 'https://www.youtube.com/watch?v=hyUJjb-uK0Y'
          },
        ]),
    Course(
        name: 'MayoCardial Effects',
        id: 'kskl',
        imgUrl:
            'https://cdn.pixabay.com/photo/2015/07/19/10/00/school-work-851328_960_720.jpg',
        vidCode: 'nrEBoPYS4ns',
        owner: "M Barakat",
        videoNum: 2,
        addresses: [
          {
            'vidName': 'kk',
            'url': 'https://www.youtube.com/watch?v=hyUJjb-uK0Y'
          },
          {
            'vidName': 'kk',
            'url': 'https://www.youtube.com/watch?v=hyUJjb-uK0Y'
          },
        ])
  ];

  List<Course> get fetch {
    return [..._courses];
  }

  void add(
    String id,
    String name,
    String owner,
    String vidCode,
    String imgUrl,
    int videoNum,
    List<Map<String, String>> addresses,
  ) {
    _courses.add(Course(
        name: name,
        id: id,
        imgUrl: imgUrl,
        vidCode: vidCode,
        owner: owner,
        videoNum: videoNum,
        addresses: addresses));
  }

  void addCourses() {
    StreamBuilder(
      stream: FirebaseFirestore.instance.collection('courses').snapshots(),
      builder: (ctx, chatSnapshot) {
        var length = chatSnapshot.data?.docs.length;
        for (var i = 0; i < length!; i++) {
          add(
              chatSnapshot.data!.docs[i].id,
              chatSnapshot.data!.docs[i]['name'],
              chatSnapshot.data!.docs[i]['owner'],
              'kk',
              chatSnapshot.data!.docs[i]['imgUrl'],
              chatSnapshot.data!.docs[i]['videoNum'],
              chatSnapshot.data!.docs[i]['vids']);
        };
        return Text('');
      },

    );
  }
}
