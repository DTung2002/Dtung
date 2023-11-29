import 'package:education_app/constants/color.dart';
import 'package:education_app/screens/GraphicCourse.dart';
import 'package:education_app/screens/PhotoCourse.dart';
import 'package:education_app/screens/blank.dart';
import 'package:flutter/material.dart';
import 'package:education_app/models/category.dart';
import 'package:education_app/screens/dCourse.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  void initState() {
    super.initState();
    setState(() {
      filteredCategories = categoryList;
    });
  }

  void onSearch(String search) {
    setState(() {
      filteredCategories =
          categoryList.where((category) => category.name.toLowerCase().contains(search))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                onSearch(value);
              });
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 26,
              ),
              suffixIcon: const Icon(
                Icons.mic,
                color: kPrimaryColor,
                size: 26,
              ),
            ),
          ),
          if (filteredCategories.isNotEmpty) // Show the ListView if filteredCategories is not empty
            ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return userComponent(category: category);
              },
            ),
        ],
      ),
    );
  }


  userComponent({ required Category category}) {

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
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(category.thumbnail),
                      )
                  ),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.name, style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                        SizedBox(height: 5,),
                        Text(
                            "${category.noOfCourses.toString()} courses",
                            style: TextStyle(color: Colors.grey[500])),
                        Text(category.state),
                      ]
                  )
                ]
            ),
          ],
        ),

      ),
    );
  }
}


