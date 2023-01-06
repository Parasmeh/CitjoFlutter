import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/ModelProvider.dart';
import '../../models/Post.dart';
import '../../stores/userStore.dart';
import '../../widgets/feed.dart';
import '../shimmer.dart';

class GlobalNews extends StatefulWidget {
  GlobalNews({
    Key? key,
  }) : super(key: key);

  @override
  State<GlobalNews> createState() => _GlobalNewsState();
}

class _GlobalNewsState extends State<GlobalNews> {
  late bool _isLoading = false;
  // final QueryRepository _queryRepo = QueryRepository();

  // final UserRepository _userRepo = UserRepository();

  @override
  void initState() {
    loader();
    super.initState();
  }

  void loader() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Selector<UserStore, List<Post>>(
            selector: (_, UserStore) => UserStore.allPosts,
            builder: (_, allPosts, __) {
              final List<Post> posts = allPosts;
              // Consumer<UserStore>(builder: (_, userStore, __) {
              //   final List<Post> posts = userStore.allPosts;
              print('Global Posts Count: ${posts.length}');

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

              return _isLoading
                  ? ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) => const NewsCardSkelton(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                    )
                  : PageView.builder(
                      itemCount: posts.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final Post post = posts[index];
                        context.read<UserStore>().fetchPostUser(post.userID);
                        User postUser =
                            context.watch<UserStore>().postUsers[post.userID]!;
                        // late bool isSubed = false;

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
