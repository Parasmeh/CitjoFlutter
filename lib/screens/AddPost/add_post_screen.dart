import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/app_colors.dart';
import '../../repositories/query_repository.dart';
import '../../routes/routes_path.dart';
import '../../services/get_it_service.dart';
import '../../services/navigation_service.dart';
import '../../stores/userStore.dart';
import '../Dashboard.dart';
import 'location_screen.dart';
import 'post_category.dart';
import 'video_preview.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AddPostScreen extends StatefulWidget {
  static const String id = 'AddPostScreen';

  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final QueryRepository _queryRepo = QueryRepository();

  // final UserRepository _userRepo = UserRepository.instance();
  final PageController _pageController = PageController();
  int currentPage = 0;

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
                children: [
                  AddPostPage1(pageController: _pageController),
                  AddPostPage2(pageController: _pageController),
                  AddPostPage3(pageController: _pageController),
                ],
                onPageChanged: (int index) {},
              ),
              Align(
                alignment: Alignment.topCenter,
                // left: MediaQuery.of(context).size.width * 0.05,
                child: SmoothPageIndicator(
                  count: 3,
                  controller: _pageController,
                  effect: const WormEffect(
                    dotWidth: 80,
                    dotHeight: 4,
                    activeDotColor: AppColors.primary,
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       MaterialButton(
              //         height: 42,
              //         minWidth: MediaQuery.of(context).size.width * 0.4,
              //         // color: AppColors.primary,
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(
              //               color: AppColors.primary, width: 0.6),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         onPressed: previousPage,
              //
              //         child: Text(
              //           (0 == 0) ? 'Discard' : 'Back',
              //           style: Theme.of(context).textTheme.headlineLarge?.merge(
              //                 const TextStyle(color: AppColors.primary),
              //               ),
              //         ),
              //       ),
              //       MaterialButton(
              //         height: 42,
              //         minWidth: MediaQuery.of(context).size.width * 0.4,
              //         color: AppColors.primary,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         // onPressed: nextPage,
              //         onPressed: () async {
              //           await Provider.of<UserStore>(context, listen: false).uploadPost();
              //         },
              //         child: Text(
              //           (1 == 2) ? 'Post' : 'Next',
              //           style: Theme.of(context).textTheme.headlineLarge?.merge(
              //                 const TextStyle(color: AppColors.white),
              //               ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddPostPage1 extends StatelessWidget {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  AddPostPage1({Key? key, required this.pageController}) : super(key: key);

  final _queryRepository = QueryRepository();

  final PageController pageController;

  void nextPage() {
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Headline',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.merge(const TextStyle(
                                          color: AppColors.grey)),
                                ),
                                Text('*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                Provider.of<UserStore>(context, listen: false)
                                    .localPost['title'] = value;
                              },
                              // keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Add Headline and Description',
                              ),
                            ),
                          ]),
                    ),
                    Consumer<UserStore>(builder: (_, userStore, __) {
                      print(userStore.localPost);
                      // print(userStore.localPost['video'].path);
                      if (userStore.localPost['video'] != null) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            // height: 16 * 20,
                            // width: 9 * 20,
                            child: VideoPreview(
                                videoUrl: userStore.localPost['video'].path));
                      } else {
                        return Container();
                      }
                    }),
                    MaterialButton(
                      // height: 328,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.video,
                        );
                        print(result);
                        print(result!.files.single.path);
                        if (result != null) {
                          File file = File(result.files.single.path!);
                          print(file.path);
                          Provider.of<UserStore>(context, listen: false)
                              .localPost['video'] = file;
                        } else {
                          print('User canceled the picker');
                        }
                        Provider.of<UserStore>(context, listen: false)
                            .notifyListeners();
                      },
                      child: Text(
                        'Upload Video',
                        style: Theme.of(context).textTheme.headlineLarge?.merge(
                              const TextStyle(color: AppColors.white),
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
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
                      onPressed: () {
                        Provider.of<UserStore>(context, listen: false)
                            .localPost
                            .clear();
                        _navigationService.replaceAndNavigateTo(RoutePath.Home);
                      },

                      child: Text(
                        'Discard',
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
                      // onPressed: nextPage,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddPostPage2 extends StatelessWidget {
  const AddPostPage2({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  void nextPage() {
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Text(
                        'Add Hashtags',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.merge(const TextStyle(color: AppColors.grey)),
                      ),
                      Text('*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {
                      Provider.of<UserStore>(context, listen: false)
                          .localPost['tags'] = value;
                    },
                    // keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Add #hashtags',
                    ),
                  ),
                ]),
                Consumer<UserStore>(builder: (_, userStore, __) {
                  print(userStore.localPost);
                  if (userStore.localPost['thumb'] != null) {
                    return SizedBox(
                      height: 250,
                      child:
                          Image(image: FileImage(userStore.localPost['thumb'])),
                    );
                    // return Container();
                  } else {
                    return Container();
                  }
                }),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    print(result);
                    print(result!.files.single.path);
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      print(file.path);
                      // _queryRepository.storeVideo(file);
                      Provider.of<UserStore>(context, listen: false)
                          .localPost['thumb'] = file;
                    } else {
                      print('User canceled the picker');
                    }
                    Provider.of<UserStore>(context, listen: false)
                        .notifyListeners();
                  },
                  child: Text(
                    'Add Thumbnail',
                    style: Theme.of(context).textTheme.headlineLarge?.merge(
                          const TextStyle(color: AppColors.white),
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  // color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(color: AppColors.primary, width: 0.6),
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
                  // onPressed: nextPage,
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
          ],
        ),
      ),
    );
  }
}

class AddPostPage3 extends StatefulWidget {
  AddPostPage3({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  State<AddPostPage3> createState() => _AddPostPage3State(pageController);
}

class _AddPostPage3State extends State<AddPostPage3> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  final PageController pageController;

  _AddPostPage3State(this.pageController);

  void nextPage() {
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserStore>(context, listen: false).localPost['comments'] =
        isTrue;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: LocationScreen(),
                ),
                Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: PostCategories(),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Category',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.merge(
                                      const TextStyle(color: AppColors.black)),
                            ),
                            Text('*', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        const ImageIcon(
                          AssetImage('assets/images/arrow_forward.png'),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Allow Comments ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.merge(const TextStyle(color: AppColors.black)),
                      ),
                      Switch(
                        value: isTrue,
                        onChanged: (value) {
                          setState(() {
                            isTrue = value;
                            Provider.of<UserStore>(context, listen: false)
                                .localPost['comments'] = isTrue;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  // color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(color: AppColors.primary, width: 0.6),
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
                  // onPressed: nextPage,
                  onPressed: () async {
                    final localPost =
                        Provider.of<UserStore>(context, listen: false)
                            .localPost;

                    if (localPost['title'] == null ||
                        localPost['title'] == '') {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                child: Text('Title'),
                              ),
                            );
                          });
                    } else if (localPost['video'] == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                child: Text('Video'),
                              ),
                            );
                          });
                    } else if (localPost['tags'] == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                child: Text('Tags'),
                              ),
                            );
                          });
                    } else if (localPost['thumb'] == null) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              child: Text('Thumbnail'),
                            ),
                          );
                        },
                      );
                    } else if (localPost['category'] == null ||
                        localPost['category'] == []) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                child: Text('Category'),
                              ),
                            );
                          });
                    } else if (localPost['comments'] == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                child: Text('Allow Comments?'),
                              ),
                            );
                          });
                    } else {
                      // _navigationService.navigateTo(RoutePath.Loading);
                      Future<bool>? isPosting;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FutureBuilder(
                              future: isPosting,
                              builder: (context, data) {
                                if (data.hasData) {
                                  Provider.of<UserStore>(context, listen: false)
                                      .localPost
                                      .clear();
                                  return Dashboard();
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      );
                      isPosting = Provider.of<UserStore>(context, listen: false)
                          .uploadPost();

                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        // title: 'Post Uploaded Successfully',
                        // desc: 'Dialog description here.............',
                        body: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Post Uploaded Successfully",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                              height: 42,
                              minWidth: MediaQuery.of(context).size.width * 0.5,
                              color: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.merge(
                                      const TextStyle(color: AppColors.white),
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ).show();
                      // _navigationService.replaceAndNavigateTo(RoutePath.Home);
                    }
                  },
                  child: Text(
                    'Post',
                    style: Theme.of(context).textTheme.headlineLarge?.merge(
                          const TextStyle(color: AppColors.white),
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
