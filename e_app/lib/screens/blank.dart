import 'package:education_app/models/category.dart';
import 'package:education_app/screens/details.dart';
import 'package:flutter/material.dart';
class BlankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
    );
  }
}