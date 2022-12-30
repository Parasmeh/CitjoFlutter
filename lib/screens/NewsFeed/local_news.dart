import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Post.dart';
import '../../models/User.dart';
import '../../stores/userStore.dart';
import '../../widgets/feed.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({
    Key? key,
  }) : super(key: key);

  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserStore>(context, listen: false).queryLocalPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Consumer<UserStore>(
          builder: (_, userStore, __) {
            // Consumer<UserStore>(builder: (_, userStore, __) {
            final List<Post> posts = userStore.localPosts;
            print('Local Posts Count: ${posts.length}');

            if (posts.length == 0) {
              return Stack(
                children: [
                  Center(child: Image.asset('assets/images/no_post.png')),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF000000).withOpacity(0.6),
                          Colors.transparent,
                          Colors.transparent,
                          const Color(0xFF000000).withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return PageView.builder(
              itemCount: posts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                Provider.of<UserStore>(context)
                    .fetchPostUser(posts[index].userID);
                final Post post = posts[index];
                context.read<UserStore>().fetchPostUser(post.userID);
                User postUser =
                    context.watch<UserStore>().postUsers[post.userID]!;
                // User postUser = userStore.postUser;
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
          },
        ),
      ],
    );
  }
}
