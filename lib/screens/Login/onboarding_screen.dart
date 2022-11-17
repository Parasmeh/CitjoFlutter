
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/app_colors.dart';
import '../../repositories/auth_repository.dart';
import '../../routes/routes_path.dart';
import '../../services/get_it_service.dart';
import '../../services/navigation_service.dart';
import '../../stores/userStore.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'OnboardingScreen';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final AuthRepository _authRepository = AuthRepository();
  final PageController _pageController = PageController();
  double currentPage = 0;

  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        // top: false,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: const [
                OnboardingItem(
                  imageUrl: 'assets/images/Onboarding1.png',
                  title: 'Open platform',
                  description:
                      'Citjo is an open platform with no upfront cost to use, and distribute.',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/Onboarding2.png',
                  title: 'Real-time local news',
                  description:
                      'Information that is relayed at the time it happens.',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/Onboarding3.png',
                  title: 'Multilingual',
                  description:
                      'News is offered in over 11 different languages.',
                ),
              ],
              onPageChanged: (int index) {
                // _currentPageNotifier.value = index;
              },
            ),
            Positioned(
              // alignment: Alignment.center,
              bottom: 60,
              left: MediaQuery.of(context).size.width * 0.5 - 32,
              child: SmoothPageIndicator(
                count: 3,
                controller: _pageController,
                effect: const WormEffect(
                  dotWidth: 16,
                  dotHeight: 4,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
                child: MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    bool isSignedIn = await _authRepository.signInWithGoogle();
                    // print('signInWithGoogle Complete');
                    if (isSignedIn) {
                      // print('isSignedIn ');
                      await _authRepository.getCurrUser();
                      print('getCurrUser Complete');
                      // Navigator.of(context).pushNamed(Dashboard.id);
                      Provider.of<UserStore>(context, listen: false).init();
                      _navigationService.popAllAndNavigateTo(RoutePath.Home);
                    } else {
                      print('-----------------Inside Else----------------');
                      // Navigator.of(context).pushNamed(Dashboard.id);
                    }
                    Provider.of<UserStore>(context, listen: false).init();
                    // _navigationService.popAllAndNavigateTo(RoutePath.Home);
                    // Navigator.of(context).pushNamed(Dashboard.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/google-icon.svg',height: 20, width: 20,color: AppColors.white,),
                      SizedBox(width: 8,),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          fit: BoxFit.fitWidth,
          image: AssetImage(imageUrl),
          height: MediaQuery.of(context).size.height * 0.8,
          // width: MediaQuery.of(context).size.width * 0.4,
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.32,
        //   width: 276,
        //   child: Center(
        //     child: Text(
        //       '$title \n$description',
        //       style: Theme.of(context).textTheme.bodyLarge,
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
