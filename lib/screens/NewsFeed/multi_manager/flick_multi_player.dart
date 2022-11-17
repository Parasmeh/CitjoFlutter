import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../models/Post.dart';
import '../../../routes/routes_path.dart';
import '../../../services/get_it_service.dart';
import '../../../services/navigation_service.dart';
import './flick_multi_manager.dart';
import '../../../Theme/app_colors.dart';
import '../../../models/User.dart';
import '../../../stores/userStore.dart';
import '../../../widgets/feed.dart';
import '../../../widgets/profile_pic.dart';
import '../portrait_controls.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer(
      {Key? key,
      required this.url,
      this.image,
      required this.flickMultiManager,
      required this.postUser,
      required this.thisPost})
      : super(key: key);

  final String url;
  final String? image;
  final FlickMultiManager flickMultiManager;
  final User postUser;
  final Post thisPost;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  late FlickManager flickManager;

  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url)
        ..setLooping(true),
      autoPlay: false,
    );
    widget.flickMultiManager.init(flickManager);

    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserStore>(context, listen: false);
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: Stack(
        children: [
          FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              playerLoadingFallback: Positioned.fill(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      // right: 10,
                      // top: 10,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 3,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controls: FeedPlayerPortraitControls(
                flickMultiManager: widget.flickMultiManager,
                flickManager: flickManager,
              ),
            ),
            flickVideoWithControlsFullscreen: FlickVideoWithControls(
              playerLoadingFallback: Center(
                  child: Image.network(
                widget.image!,
                fit: BoxFit.fitWidth,
              )),
              controls: FlickLandscapeControls(),
              iconThemeData: IconThemeData(
                size: 40,
                color: Colors.white,
              ),
              textStyle: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            // alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await store.fetchOtherUser(widget.postUser.id);
                      await store.queryUserPosts(widget.postUser.id);
                      _navigationService.navigateTo(RoutePath.ViewProfile);
                    },
                    child: Row(
                      children: [
                        ProfilePic(
                            radius: 18,
                            picUrl: widget.postUser.profilePicUrl!,
                            name: ""),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            widget.postUser.username!,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(
                      Icons.mic,
                      size: 14,
                      color: Colors.blue,
                    ),
                  ),
                  Selector<UserStore, Map<String, User>>(
                    selector: (_, UserStore) => UserStore.postUsers,
                    builder: (_, postUsers, __) {
                      final User currUser;
                      if (postUsers[widget.thisPost.userID]! != null) {
                        currUser = postUsers[widget.thisPost.userID]!;
                      } else {
                        currUser = User();
                      }
                      final List subed = [];
                      if (currUser.subscribed != null) {
                        subed.addAll(currUser.subscribed!);
                      }
                      final bool isSubed = subed.contains(widget.postUser.id);
                      // print(subers);
                      return MaterialButton(
                        color: isSubed ? null : AppColors.primary,
                        height: 32,
                        minWidth: 32,
                        // color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AppColors.primary, width: 0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          // await _userRepo.subscribeQuery(postUser.id!);
                          Provider.of<UserStore>(context, listen: false)
                              .changeSubed(widget.postUser.id);
                        },

                        child: Text(
                          isSubed ? 'Subscribed' : 'Subscribe',
                          style:
                              Theme.of(context).textTheme.headlineLarge?.merge(
                                    TextStyle(
                                        color: isSubed
                                            ? AppColors.primary
                                            : AppColors.white),
                                  ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // alignment: Alignment.bottomRight,
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return MoreOptionSection(
                      userId: widget.postUser.id,
                      postId: widget.thisPost.id,
                      videoUrl: widget.thisPost.postVideoUrl!,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
