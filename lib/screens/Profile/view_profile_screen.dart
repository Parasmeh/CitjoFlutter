import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../models/Post.dart';
import '../../models/User.dart';
import '../../services/get_it_service.dart';
import '../../services/navigation_service.dart';
import '../../stores/userStore.dart';
import '../../widgets/profile_pic.dart';
import '../../widgets/video_post.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  int currentIndex = 0;
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Consumer<UserStore>(builder: (_, userStore, __) {
          final User user = userStore.otherUser;

          final List<Post> posts = userStore.userPosts;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePic(picUrl: user.profilePicUrl!, name: 'name'),
                  Row(
                    children: [
                      ProfileStatItem(
                          title: 'Posts',
                          count: posts != null ? posts.length : 0),
                      ProfileStatItem(
                          title: 'Subscribers',
                          count: user.subscribers != null
                              ? user.subscribers!.length
                              : 0),
                      ProfileStatItem(
                          title: 'Subscribed',
                          count: user.subscribed != null
                              ? user.subscribed!.length
                              : 0),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.username!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                  Selector<UserStore, User>(
                      selector: (_, UserStore) => UserStore.otherUser,
                      builder: (_, otherUser, __) {
                        final currUser = context.watch<UserStore>().currUser;
                        final List subed = [];
                        if (currUser.subscribed != null) {
                          subed.addAll(currUser.subscribed!);
                        }
                        final bool isSubed = subed.contains(otherUser.id);
                        // print(isSubed);
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
                                .changeSubed(otherUser.id);
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
                        );
                      }),
                  MaterialButton(
                    height: 32,
                    minWidth: 32,
                    // color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: AppColors.secondary, width: 0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 100,
                            child: Center(
                              child: Text(
                                'Email: ' + user.email!,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      );
                    },

                    child: Text(
                      'Contact',
                      style: Theme.of(context).textTheme.headlineLarge?.merge(
                            TextStyle(color: AppColors.secondary),
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user.bio!),
                ],
              ),
              Divider(thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final thisPost = posts[index];
                    Provider.of<UserStore>(context, listen: false)
                        .fetchPostUser(posts[index].userID);
                    User postUser = userStore.postUsers[posts[index].userID]!;
                    return VideoPost(
                      thumbUrl: thisPost.postThumbUrl!,
                      likes: thisPost.likes!,
                      title: thisPost.desc!,
                      videoUrl: thisPost.postVideoUrl!,
                      postUser: postUser,
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ProfileStatItem extends StatelessWidget {
  final int count;
  final String title;

  const ProfileStatItem({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.merge(const TextStyle(color: AppColors.greyDark)),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.merge(const TextStyle(color: AppColors.greyDark)),
          ),
        ],
      ),
    );
  }
}
