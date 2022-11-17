import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/video_player_widget.dart';

class NetworkPlayerController extends StatefulWidget {
  final String videoUrl;

  const NetworkPlayerController({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<NetworkPlayerController> createState() =>
      _NetworkPlayerControllerState(videoUrl);
}

class _NetworkPlayerControllerState extends State<NetworkPlayerController> {
  late VideoPlayerController controller;
  final String videoUrl;

  _NetworkPlayerControllerState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(videoUrl)
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
