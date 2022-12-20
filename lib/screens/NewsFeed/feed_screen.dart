import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../repositories/query_repository.dart';
import '../../stores/userStore.dart';
import '../../widgets/categories_drawer.dart';
import 'global_news.dart';
import 'local_news.dart';
import 'subscribed_news.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final _queryRepository = QueryRepository();
  int _currentIndex = 0;
  final _pageController = PageController();

  //Posts Stream Subscription
  /* late StreamSubscription postStream;
  var queryRepo = context.read<QueryRepository>();
  postStream = Amplify.DataStore.observe(Post.classType).listen((event) {

    if(event.eventType != EventType.create){
      return;
    }

    if(queryRepo.posts[0].id != event.item.id){
      queryRepo.posts.insert(0, event.item);
      print('Received event of type ' + event.eventType.toString());
      print('Received post ' + event.item.toString());
    }
  });
 */

  void getNewsFeed() async {
    UserStore().querySubscribedPosts();
    UserStore().queryAllPosts();
    UserStore().queryLocalPosts();
  }

  @override
  void initState() {
    super.initState();
    // getNewsFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset('assets/icons/category.svg',
                  color: Colors.black, width: 24),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          // child: Text('Citjo',style: GoogleFonts.rubik(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0),),
          child: Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
            height: 28,
          ),
        ),
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Categories(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentIndex = page;
                });
              },
              children: [
                SubscribedNews(),
                // SubscribedFullScreen(),
                LocalNews(),
                GlobalNews(),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 0.4,
                  color: AppColors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        //async
                        Provider.of<UserStore>(context, listen: false)
                            .querySubscribedPosts();
                        _pageController.jumpToPage(0);
                      },
                      child: Text(
                        'Subscribed',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.merge(TextStyle(
                              color: Colors.transparent,
                              shadows: [
                                Shadow(
                                    color: (_currentIndex == 0)
                                        ? AppColors.black
                                        : AppColors.white,
                                    offset: Offset(0, -5))
                              ],
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
                          Provider.of<UserStore>(context, listen: false)
                              .queryLocalPosts();
                          _pageController.jumpToPage(1);
                        },
                        child: Text(
                          'Local',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.merge(TextStyle(
                                color: Colors.transparent,
                                shadows: [
                                  Shadow(
                                      color: (_currentIndex == 0)
                                          ? AppColors.black
                                          : AppColors.white,
                                      offset: Offset(0, -5))
                                ],
                                decorationThickness: 4,
                                decoration: TextDecoration.underline,
                                decorationColor: (_currentIndex == 1)
                                    ? AppColors.primary
                                    : Colors.transparent,
                              )),
                        )),
                    TextButton(
                      onPressed: () {
                        Provider.of<UserStore>(context, listen: false)
                            .queryAllPosts();
                        _pageController.jumpToPage(2);
                      },
                      child: Text(
                        'Trending',
                        style: Theme.of(context).textTheme.headlineLarge?.merge(
                              TextStyle(
                                color: Colors.transparent,
                                shadows: [
                                  Shadow(
                                      color: (_currentIndex == 0)
                                          ? AppColors.black
                                          : AppColors.white,
                                      offset: Offset(0, -5))
                                ],
                                decorationThickness: 4,
                                decoration: TextDecoration.underline,
                                decorationColor: (_currentIndex == 2)
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
