import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/video_player_widget.dart';

class VideoPreview extends StatefulWidget {
  final String videoUrl;

  const VideoPreview({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<VideoPreview> createState() =>
      _VideoPreview(videoUrl);
}

class _VideoPreview extends State<VideoPreview> {
  late VideoPlayerController controller;
  final String videoUrl;

  _VideoPreview(this.videoUrl);

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(File(videoUrl))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}
