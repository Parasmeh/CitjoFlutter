
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../models/Post.dart';
import '../../models/User.dart';
import '../../repositories/user_repository.dart';
import '../../routes/routes_path.dart';
import '../../services/get_it_service.dart';
import '../../services/navigation_service.dart';
import '../../stores/userStore.dart';
import '../../widgets/profile_pic.dart';
import '../../widgets/video_post.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  final TextEditingController _controller = TextEditingController();

  // final void Function(String) onTextChange;

  //_SearchScreenState({ this.onTextChange });
  final UserRepository _userRepository = UserRepository();
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    _controller.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // You need to do this.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) async {
                Provider.of<UserStore>(context, listen: false)
                    .querySearchTopPosts(value);
                Provider.of<UserStore>(context, listen: false)
                    .querySearchLatestPosts(value);
                Provider.of<UserStore>(context, listen: false)
                    .querySearchUsers(value);
              },
              controller: _controller,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  // hintStyle: const TextStyle(
                  //   color: Colors.black,
                  // ),
                  // fillColor: Colors.black.withOpacity(0.1),
                  // filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search something ...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    _pageController.jumpToPage(0);
                    Provider.of<UserStore>(context, listen: false)
                        .queryAllPosts();
                  },
                  child: Text(
                    'Top',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(TextStyle(
                          shadows: [
                            Shadow(
                                color: AppColors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decorationThickness: 4,
                          decoration: TextDecoration.underline,
                          decorationColor: (_currentIndex == 0)
                              ? AppColors.primary
                              : Colors.transparent,
                        )),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(1);
                    },
                    child: Text(
                      'Latest',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.merge(TextStyle( shadows: [
                        Shadow(
                            color: AppColors.black, offset: Offset(0, -5))
                      ],
                        color: Colors.transparent,
                            // color: Colors.transparent,
                            decorationThickness: 4,
                            decoration: TextDecoration.underline,
                            decorationColor: (_currentIndex == 1)
                                ? AppColors.primary
                                : Colors.transparent,
                          )),
                    )),
                TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text(
                      'People',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.merge(TextStyle( shadows: [
                        Shadow(
                            color: AppColors.black, offset: Offset(0, -5))
                      ],
                        color: Colors.transparent,
                            // color: Colors.transparent,
                            decorationThickness: 4,
                            decoration: TextDecoration.underline,
                            decorationColor: (_currentIndex == 2)
                                ? AppColors.primary
                                : Colors.transparent,
                          )),
                    )),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentIndex = page;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  Consumer<UserStore>(builder: (_, userStore, __) {
                    final List<Post> posts = userStore.searchTopPosts;
                    print(posts);
                    return SearchFeed(posts: posts);
                  }),
                  Consumer<UserStore>(builder: (_, userStore, __) {
                    final List<Post> posts = userStore.searchLatestPosts;
                    print(posts);
                    return SearchFeed(posts: posts);
                  }),
                  Consumer<UserStore>(builder: (_, userStore, __) {
                    final List<User> users = userStore.searchUsers;
                    // print(users);
                    print(' ListView.builder...123.');
                    return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final User user = users[index];
                          final store =
                              Provider.of<UserStore>(context, listen: false);
                          final List subed = [];
                          if (store.currUser.subscribed != null) {
                            subed.addAll(store.currUser.subscribed!);
                          }
                          final bool isSubed = subed.contains(user.id);
                          // print(subers);

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await Provider.of<UserStore>(context,
                                            listen: false)
                                        .fetchOtherUser(user.id);
                                    await Provider.of<UserStore>(context,
                                            listen: false)
                                        .queryUserPosts(user.id);
                                    _navigationService
                                        .navigateTo(RoutePath.ViewProfile);
                                  },
                                  child: Row(
                                    children: [
                                      ProfilePic(
                                          picUrl: user.profilePicUrl!,
                                          name: ''),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(user.username!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge),
                                      ),
                                    ],
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
                                    Provider.of<UserStore>(context,
                                            listen: false)
                                        .changeSubed(user.id);
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
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchFeed extends StatelessWidget {
  const SearchFeed({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final thisPost = posts[index];
        Provider.of<UserStore>(context, listen: false)
            .fetchPostUser(posts[index].userID);
        User postUser = Provider.of<UserStore>(context, listen: false)
            .postUsers[thisPost.userID]!;
        return VideoPost(
          thumbUrl: thisPost.postThumbUrl!,
          likes: thisPost.likes!,
          title: thisPost.desc!,
          videoUrl: thisPost.postVideoUrl!,
          postUser: postUser,
        );
      },
    );
  }
}

class SearchChip extends StatelessWidget {
  final String title;

  SearchChip({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ActionChip(
        label: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.merge(
                TextStyle(color: (title == 'People') ? AppColors.white : null),
              ),
        ),
        backgroundColor: (title == 'People') ? AppColors.primary : null,
        onPressed: () {},
      ),
    );
  }
}
