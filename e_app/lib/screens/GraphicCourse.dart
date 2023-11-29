import 'package:education_app/constants/color.dart';
import 'package:education_app/models/DCourse.dart';
import 'package:education_app/models/GraphicCourse.dart';
import 'package:education_app/screens/details2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GraphicScreen extends StatefulWidget {
  const GraphicScreen({Key? key}) : super(key: key);

  @override
  _GraphicScreen createState() => _GraphicScreen();
}

class _GraphicScreen extends State<GraphicScreen> {
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
                          'Graphic Design',
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
                        course: GraphicCourses[index],
                      );
                    },
                    itemCount: GraphicCourses.length,
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
  final GraphicCourse course;

  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen2(
                      title: course.name,
                    )));
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
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