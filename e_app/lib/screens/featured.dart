import 'package:education_app/constants/color.dart';
import 'package:education_app/constants/size.dart';
import 'package:education_app/models/category.dart';
import 'package:education_app/screens/GraphicCourse.dart';
import 'package:education_app/screens/PhotoCourse.dart';
import 'package:education_app/screens/blank.dart';
import 'package:education_app/screens/dCourse.dart';
import 'package:education_app/screens/details.dart';
import 'package:education_app/widgets/circle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/widgets/search.dart';


class FeaturedScreen extends StatefulWidget {
  final String username;
  const FeaturedScreen({Key? key, required this.username}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
        body: SingleChildScrollView( //SingleChildScrollView
          child: Column(
            children: const [
              AppBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final category = filteredCategories[index];
          return CategoryCard(
            category: category,
          );
        },
      );
    }
  }



class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (category.name == 'Development') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DCourseScreen(),
              ),
            );
          } else if (category.name == 'Photography') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => PhotoScreen(),
            ),
            );
          }
          else if (category.name == 'Graphic Design') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => GraphicScreen(),
            ),
            );
          }
          else {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => BlankWidget(),
            ),
            );
          }
        },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(category.state),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {

  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xa9181818),
            Color(0xa9181818),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back!',
                style:TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(Color(0xa9181818)), // Đổi màu thành đỏ
              //     ),
              //   onPressed: () {
              //     // Đăng xuất người dùng
              //     FirebaseAuth.instance.signOut();
              //     // Chuyển về màn hình đăng nhập/đăng ký
              //     Navigator.pop(context);
              //   },
              //    child: Align(
              //        alignment: Alignment.topRight,
              //        child:Text('Logout',
              //      style:TextStyle(fontSize: 10, color: Colors.white),)
              //
              //    )
              // ),

              CircleButton(
                icon: Icons.notifications,
                onPressed: () {
                }
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
           SearchTextField()
        ],
      ),
    ),
    );
  }
}