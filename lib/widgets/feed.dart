import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../Theme/app_colors.dart';
import '../models/ModelProvider.dart';
import '../models/Post.dart';
import '../models/User.dart';
import '../repositories/user_repository.dart';
import '../routes/routes_path.dart';
import '../screens/NewsFeed/network_video.dart';
import '../services/get_it_service.dart';
import '../services/navigation_service.dart';
import '../stores/userStore.dart';
import 'comment_section.dart';
import 'report_section.dart';

class Feed extends StatefulWidget {
  final String videoUrl;
  final List likes;
  final User postUser;
  final String postId;
  final Post post;

  // final List comments;
  final String desc;

  Feed(
      {Key? key,
      required this.videoUrl,
      required this.likes,
      required this.desc,
      required this.postUser,
      required this.postId,
      required this.post})
      : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  UserRepository _userRepo = UserRepository();
  late VideoPlayerController _videoPlayerController;
  // late ChewieController _chewieController;

  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    // _chewieController = ChewieController(
    //     videoPlayerController: _videoPlayerController,
    //     aspectRatio: _videoPlayerController.value.aspectRatio,
    //     allowedScreenSleep: false,
    //     allowFullScreen: true,
    //     deviceOrientationsAfterFullScreen: [
    //       DeviceOrientation.landscapeRight,
    //       DeviceOrientation.landscapeLeft,
    //       DeviceOrientation.portraitUp,
    //       DeviceOrientation.portraitDown,
    //     ],
    //     autoInitialize: true,
    //     autoPlay: true,
    //     showControls: true,
    //     errorBuilder: (context, errorMessage) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
    _videoPlayerController.initialize();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // _chewieController.addListener(() {
    //   if (_chewieController.isFullScreen) {
    //     SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.landscapeRight,
    //       DeviceOrientation.landscapeLeft,
    //     ]);
    //   } else {
    //     SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.portraitUp,
    //       DeviceOrientation.portraitDown,
    //     ]);
    //   }
    // });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    // _chewieController.dispose();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserStore>(context, listen: false);
    // print("---------------------------");
    // print(_videoPlayerController.value.size.height);
    // print("---------------------------");

    double ht = _videoPlayerController.value.size.height;

    return Stack(
      children: [
        Container(
          color: Colors.black,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       const Color(0xFF000000).withOpacity(0.6),
          //       Colors.transparent,
          //       Colors.transparent,
          //       const Color(0xFF000000).withOpacity(0.5),
          //     ],
          //   ),
          // ),
        ),

        // 426 - sqaure
        // 1900+ -> 16:9
        // 334 -> 9:16

        ht > 1200
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoPlayerController.value.size.width,
                    height: _videoPlayerController.value.size.height,
                    child: NetworkPlayerController(videoUrl: widget.videoUrl),
                  ),
                ),
              )
            : NetworkPlayerController(videoUrl: widget.videoUrl),

        // Center(
        //   child: FloatingActionButton(
        //     backgroundColor: Colors.transparent,
        //     onPressed: () {
        //       // Wrap the play or pause in a call to `setState`. This ensures the
        //       // correct icon is shown.
        //       setState(() {
        //         // If the video is playing, pause it.
        //         if (_videoPlayerController.value.isPlaying) {
        //           _videoPlayerController.pause();
        //         } else {
        //           // If the video is paused, play it.
        //           _videoPlayerController.play();
        //         }
        //       });
        //     },
        //     // Display the correct icon depending on the state of the player.
        //     child: Icon(
        //       _videoPlayerController.value.isPlaying
        //           ? Icons.pause
        //           : Icons.play_arrow,
        //     ),
        //   ),
        // ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<UserStore, Map<String, User>>(
                  selector: (_, UserStore) => UserStore.postUsers,
                  builder: (_, postUsers, __) {
                    final currUser = context.watch<UserStore>().currUser;
                    final User postUser;
                    if (postUsers[widget.post.userID]! != null) {
                      postUser = postUsers[widget.post.userID]!;
                    } else {
                      postUser = User();
                    }
                    final List subed = [];
                    if (currUser.subscribed != null) {
                      subed.addAll(currUser.subscribed!);
                    }
                    final bool isSubed = subed.contains(postUser.id);
                    // print(subers);
                    return Container(
                      // width: 300,
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await store.fetchOtherUser(postUser.id);
                              await store.queryUserPosts(postUser.id);
                              _navigationService
                                  .navigateTo(RoutePath.ViewProfile);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(postUser.profilePicUrl!),
                                    backgroundColor: Colors.white,
                                    radius: 18,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    postUser.username!,
                                    style: const TextStyle(
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(
                              Icons.mic,
                              size: 14,
                              color: Colors.blue,
                            ),
                          ),
                          MaterialButton(
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
                              print(postUser.id);
                              Provider.of<UserStore>(context, listen: false)
                                  .changeSubed(postUser.id);
                            },

                            child: Text(
                              isSubed ? 'Subscribed' : 'Subscribe',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.merge(
                                    TextStyle(
                                        color: isSubed
                                            ? AppColors.primary
                                            : AppColors.white),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ReadMoreText(
                  widget.desc,
                  // textAlign: TextAlign.start,
                  trimLines: 2,
                  colorClickableText: AppColors.white,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' show more',
                  trimExpandedText: ' show less',
                  moreStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.merge(const TextStyle(color: AppColors.white)),
                  // overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.merge(const TextStyle(color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 72),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Selector<UserStore, Map<String, bool>>(
                          selector: (_, UserStore) => UserStore.isLiked,
                          builder: (_, isLiked, __) {
                            final bool isLike;
                            if (isLiked[widget.postId] != null) {
                              isLike = isLiked[widget.postId]!;
                            } else {
                              isLike = false;
                            }
                            return Column(
                              children: [
                                GestureDetector(
                                  child: Icon(
                                    isLike
                                        ? Icons.thumb_up_alt
                                        : Icons.thumb_up_alt_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  onTap: () async {
                                    await Provider.of<UserStore>(context,
                                            listen: false)
                                        .changeLiked(widget.postId);
                                  },
                                ),
                                Text(
                                  widget.likes.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Open Sans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.mode_comment_outlined,
                            color: Colors.white, size: 24),
                        onTap: () async {
                          await Provider.of<UserStore>(context, listen: false)
                              .fetchComments(widget.postId);
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return CommentSection(
                                postId: widget.postId,
                              );
                            },
                          );
                        },
                      ),
                      Selector<UserStore, List<Comment>>(
                          selector: (_, UserStore) => UserStore.postComments,
                          builder: (_, postComments, __) {
                            // print(postComments.length);
                            return Text(
                              postComments.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            );
                          }),
                    ],
                  ),
                ),
                Selector<UserStore, Map<String, bool>>(
                  selector: (_, UserStore) => UserStore.isSaved,
                  builder: (_, isSaved, __) {
                    final bool isSave;
                    if (isSaved[widget.postId] != null) {
                      isSave = isSaved[widget.postId]!;
                    } else {
                      isSave = false;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        child: Icon(
                          isSave ? Icons.bookmark : Icons.bookmark_border,
                          color: Colors.white,
                          size: 24,
                        ),
                        onTap: () async {
                          print(widget.post.saves);
                          await Provider.of<UserStore>(context, listen: false)
                              .changeSaved(widget.postId);
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    child: const Icon(Icons.more_vert_rounded,
                        color: Colors.white, size: 24),
                    onTap: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return MoreOptionSection(
                            userId: widget.postUser.id,
                            postId: widget.postId,
                            videoUrl: widget.videoUrl,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MoreOptionSection extends StatelessWidget {
  final String userId;
  final String postId;
  final String videoUrl;

  const MoreOptionSection({
    Key? key,
    required this.postId,
    required this.videoUrl,
    required this.userId,
  }) : super(key: key);

  _launchURL() async {
    final url = videoUrl;
    if (await canLaunchUrl(Uri(path: videoUrl))) {
      print('can launch');
      await launchUrl(Uri(path: videoUrl));
    } else {
      print('cannpot launch');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 112,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(videoUrl))) {
                        throw 'Could not launch';
                      }
                      // _launchURL();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.share_outlined,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
            if (userId == UserStore().currUser.id)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 0.6,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(1000.0),
                      onTap: () {
                        Provider.of<UserStore>(context, listen: false)
                            .deletePost(postId);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Icon(
                          // Icons.repeat,
                          Icons.delete_outline_rounded,
                          size: 24.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'Delete Post',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.6,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return ReportSection(postId: postId);
                        },
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        Icons.flag_outlined,
                        size: 24.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
