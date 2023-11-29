import 'package:education_app/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final int videoIndex;

  const CustomVideoPlayer({
    Key? key,
    required this.videoIndex
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  final List<String> videos = [
    "assets/videos/Flutter1.mp4",
    "assets/videos/cdmt.mp4",
    "assets/videos/fapp.mp4",
    "assets/videos/form.mp4",
    "assets/videos/statewidgets.mp4",
    // Add more video asset paths as needed
  ];


  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videos.elementAt(widget.videoIndex))
    ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.pause();
              });
            },
            child: Image.asset(
              icPause,
              height: 50,
            ),
          );
        } else if (_controller.value.position.inMilliseconds -
            _controller.value.duration.inMilliseconds <
            1) {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },
              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          });
        } else {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.play();
              });
            },
            child: Image.asset(
              icLearning,
              height: 50,
            ),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            _controller,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          )
        ],
      ),
    );
  }
}
