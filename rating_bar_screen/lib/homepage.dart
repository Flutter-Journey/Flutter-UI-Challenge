import 'package:flutter/material.dart';
import 'package:rating_bar_screen/slider_widget.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _lowerValue = 9.0;
  VideoPlayerController? _controller;
  String emotion = "I love it so much!!!!!";

  @override
  void initState() {
    super.initState();
    _updateVideo(_getVideoPath(_lowerValue));
  }

  void _updateVideo(String path) {
    _controller?.dispose(); // Dispose old controller
    _controller = VideoPlayerController.asset(path)
      ..initialize().then((_) {
        setState(() {});
        _controller
          ?..setLooping(true)
          ..play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "How's your day",
              style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF69708D),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            _buildVideoPlayer(),
            const SizedBox(height: 20),
            Text(
              emotion,
              style: const TextStyle(
                  fontSize: 32,
                  color: Color(0xFF69708D),
                  fontWeight: FontWeight.w700),
            ),
            SliderWidget(
              lowerValue: _lowerValue,
              onDragging: (value) {
                setState(() {
                  _lowerValue = value;
                  emotion = _getEmotion(value);
                });
              },
              onDragCompleted: (value) {
                setState(() {
                  _lowerValue = value;
                  _updateVideo(_getVideoPath(value));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_controller != null && _controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      );
    } else {
      return SizedBox(height: MediaQuery.of(context).size.width);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  String _getEmotion(double value) {
    if (value >= 8.0) return "I love it so much !!!!!";
    if (value >= 7.0) return "I'm really love it!";
    if (value >= 6.0) return "It's awesome.";
    if (value >= 5.0) return "It wow.";
    if (value >= 4.0) return "I am okay..";
    if (value >= 3.0) return "It's not that good.";
    if (value >= 2.0) return "Very bad!";
    if (value >= 1.0) return "That's horrible.";
    return "Angry so much !!?!";
  }

  String _getVideoPath(double value) {
    if (value >= 8.0) return "assets/8-celebrate.webm";
    if (value >= 7.0) return "assets/7-loveit.webm";
    if (value >= 6.0) return "assets/5-awesome.webm";
    if (value >= 5.0) return "assets/6-wow.webm";
    if (value >= 4.0) return "assets/4-okay.webm";
    if (value >= 3.0) return "assets/3-notgood.webm";
    if (value >= 2.0) return "assets/2-verybad.webm";
    if (value >= 1.0) return "assets/1-terrible.webm";
    return "assets/0-angry.webm";
  }
}
