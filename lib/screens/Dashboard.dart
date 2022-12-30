import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../Theme/app_colors.dart';
import '../models/UserType.dart';
import '../repositories/user_repository.dart';
import '../stores/userStore.dart';
import 'AddPost/add_post_screen.dart';
import 'NewsFeed/feed_screen.dart';
import 'Notifications/notifications_screen.dart';
import 'Profile/profile_screen.dart';
import 'Search/search_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final _pageController = PageController();
  bool x = true;

  _DashboardState();

  Future _getLocation() async {
    Location location = Location();
    LocationData _pos = await location.getLocation();
    final String newLocation =
        _pos.latitude.toString() + ',' + _pos.longitude.toString();
    UserRepository().updateUserLocation(newLocation);
    print("=============================================Current position: " +
        _pos.latitude.toString() +
        ',' +
        _pos.longitude.toString() +
        '=============================================');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              currentIndex = page;
            });
          },
          children: [
            FeedScreen(),
            const SearchScreen(),
            if (Provider.of<UserStore>(context, listen: false)
                    .currUser
                    .userType ==
                UserType.USER)
              const AddPostScreen(),
            const NotificationsScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: AppColors.primary),
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/home.svg',
                color: AppColors.primary),
            label: 'News',
            icon: SvgPicture.asset('assets/icons/home.svg',
                color: AppColors.black),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/discover.svg',
                color: AppColors.primary),
            label: 'Discover',
            icon: SvgPicture.asset('assets/icons/discover.svg',
                color: AppColors.black),
          ),
          if (Provider.of<UserStore>(context, listen: false)
                  .currUser
                  .userType ==
              UserType.USER)
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/icons/add-post.svg',
                  color: AppColors.primary),
              label: 'Post',
              icon: SvgPicture.asset('assets/icons/add-post.svg',
                  color: AppColors.black),
            ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/bell.svg',
                color: AppColors.primary),
            label: 'Alerts',
            icon: SvgPicture.asset('assets/icons/bell.svg',
                color: AppColors.black),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/profile.svg',
                color: AppColors.primary),
            label: 'Profile',
            icon: SvgPicture.asset('assets/icons/profile.svg',
                color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
