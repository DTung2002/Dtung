import 'package:education_app/constants/color.dart';
import 'package:education_app/models/DCourse.dart';
import 'package:education_app/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'details1.dart';

class DCourseScreen extends StatefulWidget {
  const DCourseScreen({Key? key}) : super(key: key);

  @override
  _DCScreenState createState() => _DCScreenState();
}

class _DCScreenState extends State<DCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          //  bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Development',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context); // Quay về widget trước đó
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        course: courses[index],
                      );
                    },
                    itemCount: courses.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final DCourse course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(course.name == 'Flutter') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(
                        title: course.name,
                      )));
        }else if(course.name == "Lập trình hướng đối tượng"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen1(
                        title: course.name,
                      )));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name),
                  Text(
                    "Author ${course.author}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}