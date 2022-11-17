import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Post.dart';
import '../../models/User.dart';
import '../../stores/userStore.dart';
import '../../widgets/feed.dart';

class SubscribedFullScreen
    extends StatefulWidget {
  const SubscribedFullScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscribedFullScreen> createState() => _SubscribedFullScreenState();
}

class _SubscribedFullScreenState extends State<SubscribedFullScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() async {
      await Provider.of<UserStore>(context, listen: false).querySubscribedPosts();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Consumer<UserStore>(builder: (_, userStore, __) {
          final List<Post> posts = userStore.subscribedPosts;
          print('Subscribed Posts Count: ${posts.length}');

          return PageView.builder(
            itemCount: posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              Provider.of<UserStore>(context)
                  .fetchPostUser(posts[index].userID);
              User postUser = userStore.postUsers[posts[index].userID]!;
              late bool isSubed = false;

              return Feed(
                videoUrl: posts[index].postVideoUrl!,
                desc: posts[index].desc!,
                likes: posts[index].likes!,
                postUser: postUser,
                postId: posts[index].id,
                post: posts[index],
              );
            },
          );
        }),
      ],
    );
  }
}