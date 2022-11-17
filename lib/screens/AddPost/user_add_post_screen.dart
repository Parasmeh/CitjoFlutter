import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/app_colors.dart';

class UserAddPostScreen extends StatefulWidget {
  const UserAddPostScreen({Key? key}) : super(key: key);

  @override
  State<UserAddPostScreen> createState() => _UserAddPostScreenState();
}

class _UserAddPostScreenState extends State<UserAddPostScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  // @override
  // void initState() {
  //   _pageController.addListener(() {
  //     setState(() {
  //       currentPage = _pageController.page!;
  //     });
  //   });
  //   super.initState();
  // }

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Post",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.merge(const TextStyle(color: AppColors.black))),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              PageView(
                // physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  UserAddPostPage1(),
                  UserAddPostPage2(),
                ],
                onPageChanged: (int index) {},
              ),
              Positioned(
                // alignment: Alignment.center,
                left: MediaQuery.of(context).size.width * 0.05,
                child: SmoothPageIndicator(
                  count: 2,
                  controller: _pageController,
                  effect: WormEffect(
                    dotWidth: MediaQuery.of(context).size.width * 0.5,
                    dotHeight: 4,
                    activeDotColor: AppColors.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      height: 42,
                      minWidth: MediaQuery.of(context).size.width * 0.4,
                      // color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: AppColors.primary, width: 0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: previousPage,

                      child: Text(
                        'Back',
                        style: Theme.of(context).textTheme.headlineLarge?.merge(
                              const TextStyle(color: AppColors.primary),
                            ),
                      ),
                    ),
                    MaterialButton(
                      height: 42,
                      minWidth: MediaQuery.of(context).size.width * 0.4,
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: nextPage,
                      child: Text(
                        'Next',
                        style: Theme.of(context).textTheme.headlineLarge?.merge(
                              const TextStyle(color: AppColors.white),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAddPostPage1 extends StatelessWidget {
  static const String id = 'AddPostPage1';

  const UserAddPostPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: MediaQuery.of(context).size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is your news',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.merge(const TextStyle(color: AppColors.grey)),
                        ),
                        const TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'News text content',
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hashtags ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.merge(const TextStyle(color: AppColors.grey)),
                      ),
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Type tags using #hashtags',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserAddPostPage2 extends StatelessWidget {
  static const String id = 'AddPostPage2';

  const UserAddPostPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select location',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                  const ImageIcon(
                    AssetImage('assets/images/arrow_forward.png'),
                    size: 20,
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                  const ImageIcon(
                    AssetImage('assets/images/arrow_forward.png'),
                    size: 20,
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Allow Comments ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.merge(const TextStyle(color: AppColors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
