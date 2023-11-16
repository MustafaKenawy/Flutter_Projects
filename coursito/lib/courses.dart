// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import '/providers/course.dart';
import 'package:flutter/material.dart';
import 'package:coursito/widgets/course_view.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provided = Provider.of<Courses>(context);
    List<Course> courses = provided.fetch;
    return GridView.builder(
          padding: const EdgeInsets.all(7),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return CourseView(
              vidId: courses[index].vidCode,
              name: courses[index].name,
              owner: courses[index].owner,
              imgUrl: courses[index].imgUrl,
              id: courses[index].id,
            );
          },
          itemCount: courses.length,
    );
  }
}
