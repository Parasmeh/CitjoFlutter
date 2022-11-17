import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => VideoPlayer(controller);
}
