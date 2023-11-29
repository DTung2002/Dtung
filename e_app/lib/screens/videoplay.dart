import 'package:education_app/widgets/custom_video.dart';
import 'package:flutter/material.dart';
import 'package:education_app/models/lesson.dart';

class PlayVideoScreen extends StatefulWidget {
  final int index;
  const PlayVideoScreen({
    Key? key,
    required this.index
  }) : super(key: key);
  @override
  _PlayVideoScreen createState() => _PlayVideoScreen();
}

class _PlayVideoScreen extends State<PlayVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomVideoPlayer(videoIndex: widget.index),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('${lessonList[widget.index].name}',
              style:TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Quay về widget trước đó
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
