import 'package:coursito/video_play.dart';

import '../../providers/course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({required this.id});
  String id;

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Courses>(context);
    var courses = provided.fetch;
    var course = courses.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(course.name),
      ),
      body: Container(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text('List of content',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: course.videoNum,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Text(
                                '${index + 1} -  ${course.addresses[index]["vidName"]}',
                                style: const TextStyle(fontSize: 20),
                              )),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => VideoPlay(
                                      vidName: course.addresses[index]
                                          ['vidName']!,
                                      url: course.addresses[index]['url']!,
                                    )));
                          },
                        );
                        // return Text('${index+1}- ${course.addresses[index]}') ;
                      })),
            ],
          )),
    );
  }
}
