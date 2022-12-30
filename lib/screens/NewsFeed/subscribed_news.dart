import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:visibility_detector/visibility_detector.dart';

import './multi_manager/flick_multi_manager.dart';
import '../../Theme/app_colors.dart';
import '../../models/Post.dart';
import '../../models/User.dart';
import '../../stores/userStore.dart';
import 'multi_manager/flick_multi_player.dart';

class SubscribedNews extends StatefulWidget {
  const SubscribedNews({Key? key}) : super(key: key);

  @override
  State<SubscribedNews> createState() => _SubscribedNewsState();
}

class _SubscribedNewsState extends State<SubscribedNews> {
  late FlickMultiManager flickMultiManager = FlickMultiManager();

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   // Provider.of<UserStore>(context, listen: false).queryAllPosts();
  //   return Stack(
  //     alignment: Alignment.topCenter,
  //     children: [
  //       Selector<UserStore, List<Post>>(
  //           selector: (_, UserStore) => UserStore.subscribedPosts,
  //           builder: (_, allPosts, __) {
  //             final List<Post> posts = allPosts;
  //             // Consumer<UserStore>(builder: (_, userStore, __) {
  //             //   final List<Post> posts = userStore.allPosts;
  //             print('Global Posts Count: ${posts.length}');
  //
  //             if (posts.length == 0) {
  //               return Stack(
  //                 children: [
  //                   Center(child: Image.asset('assets/images/no_post.png')),
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(
  //                         begin: Alignment.topCenter,
  //                         end: Alignment.bottomCenter,
  //                         colors: [
  //                           const Color(0xFF000000).withOpacity(0.6),
  //                           Colors.transparent,
  //                           Colors.transparent,
  //                           const Color(0xFF000000).withOpacity(0.5),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             }
  //
  //             return PageView.builder(
  //               itemCount: posts.length,
  //               scrollDirection: Axis.vertical,
  //               itemBuilder: (BuildContext context, int index) {
  //                 final Post post = posts[index];
  //                 context.read<UserStore>().fetchPostUser(post.userID);
  //                 User postUser =
  //                     context.watch<UserStore>().postUsers[post.userID]!;
  //                 late bool isSubed = false;
  //
  //                 return Feed(
  //                   videoUrl: posts[index].postVideoUrl!,
  //                   desc: posts[index].desc!,
  //                   likes: posts[index].likes!,
  //                   postUser: postUser,
  //                   postId: posts[index].id,
  //                   post: posts[index],
  //                 );
  //               },
  //             );
  //           }),
  //     ],
  //   );
  // }
  Widget build(BuildContext context) {
    return Selector<UserStore, List<Post>>(
        selector: (_, UserStore) => UserStore.subscribedPosts,
        builder: (_, subscribedPosts, __) {
          final List<Post> posts = subscribedPosts;
          print('Subscribed Posts Count: ${posts.length}');

          if (posts.isEmpty) {
            return Center(child: Image.asset('assets/images/no_post.png'));
          }

          return VisibilityDetector(
            key: ObjectKey(flickMultiManager),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0 && this.mounted) {
                flickMultiManager.pause();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final thisPost = posts[index];
                  Provider.of<UserStore>(context, listen: false)
                      .fetchPostUser(posts[index].userID);
                  User postUser = Provider.of<UserStore>(context, listen: false)
                      .postUsers[posts[index].userID]!;

                  //videoplayer controller
                  // _videoPlayerController =
                  //     VideoPlayerController.network(thisPost.postVideoUrl!);

                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: FlickMultiPlayer(
                            thisPost: thisPost,
                            url: thisPost.postVideoUrl!,
                            flickMultiManager: flickMultiManager,
                            image: thisPost.postThumbUrl!,
                            postUser: postUser,
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     // GestureDetector(
                        //     //   onTap: () async {
                        //     //     await Provider.of<UserStore>(context,
                        //     //             listen: false)
                        //     //         .changeLiked(thisPost.id);
                        //     //   },
                        //     //   child: Row(
                        //     //     children: [
                        //     //       SvgPicture.asset('assets/icons/like.svg'),
                        //     //       SizedBox(
                        //     //         width: 6,
                        //     //       ),
                        //     //       Text(
                        //     //         '${thisPost.likes!.length}',
                        //     //         style: Theme.of(context)
                        //     //             .textTheme
                        //     //             .bodyText2
                        //     //             ?.merge(const TextStyle(
                        //     //                 color: AppColors.black)),
                        //     //       ),
                        //     //     ],
                        //     //   ),
                        //     // ),
                        //     Selector<UserStore, Map<String, bool>>(
                        //         selector: (_, UserStore) => UserStore.isLiked,
                        //         builder: (_, isLiked, __) {
                        //           final bool isLike;
                        //           if (isLiked[thisPost.id] != null) {
                        //             isLike = isLiked[thisPost.id]!;
                        //           } else {
                        //             isLike = false;
                        //           }
                        //           return Column(
                        //             children: [
                        //               Row(
                        //                 children: [
                        //                   GestureDetector(
                        //                     child: Icon(
                        //                       isLike
                        //                           ? Icons.thumb_up_alt
                        //                           : Icons.thumb_up_alt_outlined,
                        //                       color: isLike
                        //                           ? AppColors.primary
                        //                           : AppColors.greyLight,
                        //                       size: 24,
                        //                     ),
                        //                     onTap: () async {
                        //                       await Provider.of<UserStore>(
                        //                               context,
                        //                               listen: false)
                        //                           .changeLiked(thisPost.id);
                        //                     },
                        //                   ),
                        //                   SizedBox(width: 6),
                        //                   Text(
                        //                     thisPost.likes!.length.toString(),
                        //                     style: TextStyle(
                        //                         color: Colors.black,
                        //                         fontFamily: 'Open Sans',
                        //                         fontSize: 10,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           );
                        //         }),
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 28),
                        //       child: GestureDetector(
                        //         onTap: () async {
                        //           await Provider.of<UserStore>(context,
                        //                   listen: false)
                        //               .fetchComments(thisPost.id);
                        //           showModalBottomSheet<void>(
                        //             isScrollControlled: true,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //             context: context,
                        //             builder: (BuildContext context) {
                        //               return CommentSection(
                        //                 postId: thisPost.id,
                        //               );
                        //             },
                        //           );
                        //         },
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/icons/comment.svg'),
                        //             SizedBox(width: 6),
                        //             Text(
                        //               '${thisPost.likes!.length}',
                        //               style: Theme.of(context)
                        //                   .textTheme
                        //                   .bodyText2
                        //                   ?.merge(const TextStyle(
                        //                       color: AppColors.black)),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Selector<UserStore, Map<String, bool>>(
                        //         selector: (_, UserStore) => UserStore.isSaved,
                        //         builder: (_, isSaved, __) {
                        //           final bool isSave;
                        //           if (isSaved[thisPost.id] != null) {
                        //             isSave = isSaved[thisPost.id]!;
                        //           } else {
                        //             isSave = false;
                        //           }
                        //           return GestureDetector(
                        //             onTap: () async {
                        //               print(thisPost.saves);
                        //               await Provider.of<UserStore>(context,
                        //                       listen: false)
                        //                   .changeSaved(thisPost.id);
                        //             },
                        //             child: Icon(
                        //               isSave
                        //                   ? Icons.bookmark
                        //                   : Icons.bookmark_border,
                        //               color: isSave
                        //                   ? AppColors.primary
                        //                   : AppColors.greyLight,
                        //               size: 24,
                        //             ),
                        //           );
                        //         }),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ReadMoreText(
                            thisPost.desc!,
                            // textAlign: TextAlign.start,
                            trimLines: 2,
                            colorClickableText: AppColors.primary,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' show more',
                            trimExpandedText: ' show less',
                            moreStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.merge(
                                    const TextStyle(color: AppColors.primary)),
                            // overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyText2?.merge(
                                const TextStyle(color: AppColors.black)),
                          ),
                        ),
                        Divider(thickness: 1),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
