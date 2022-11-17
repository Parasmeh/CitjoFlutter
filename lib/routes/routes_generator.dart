import '../screens/AddPost/add_post_screen.dart';
import '../screens/AddPost/location_screen.dart';
import '../screens/Dashboard.dart';
import '../screens/Login/onboarding_screen.dart';
import '../screens/NewsFeed/feed_screen.dart';
import '../screens/Notifications/notifications_screen.dart';
import '../screens/Profile/edit_profile.dart';
import '../screens/Profile/profile_screen.dart';
import '../screens/Profile/view_profile_screen.dart';
import '../screens/Search/search_screen.dart';
import '../screens/Settings/settings.dart';
import '../screens/loading_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Login/splash_screen.dart';
import '../screens/Settings/privacypolicy.dart';
import '../screens/Settings/termscondition.dart';
import '../screens/Settings/ChangeTheme.dart';
import '../screens/Settings/verification_screen.dart';
import '../screens/wrapper.dart';
import 'routes_path.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.Wrapper:
      return MaterialPageRoute(builder: (_) => const Wrapper());

    case RoutePath.Splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case RoutePath.Login:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());

    case RoutePath.Home:
      return MaterialPageRoute(builder: (_) => const Dashboard());

    case RoutePath.News:
      return MaterialPageRoute(builder: (_) => FeedScreen());

    case RoutePath.Search:
      return MaterialPageRoute(builder: (_) => const SearchScreen());

    case RoutePath.AddPost:
      return MaterialPageRoute(builder: (_) => const AddPostScreen());

    case RoutePath.Notifications:
      return MaterialPageRoute(builder: (_) => const NotificationsScreen());

    case RoutePath.Profile:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());

    case RoutePath.EditProfile:
      return MaterialPageRoute(builder: (_) => const EditProfile());

    case RoutePath.Settings:
      return MaterialPageRoute(builder: (_) => const Settings());

    case RoutePath.Verification:
      return MaterialPageRoute(builder: (_) => VerifyJournalist());

    case RoutePath.Location:
      return MaterialPageRoute(builder: (_) => const LocationScreen());

    case RoutePath.ViewProfile:
      return MaterialPageRoute(builder: (_) => const ViewProfileScreen());

    case RoutePath.TermsCondition:
      return MaterialPageRoute(builder: (_) => const TermsConditions());

    case RoutePath.Privacy:
      return MaterialPageRoute(builder: (_) => const PrivacyPolicy());

    case RoutePath.ChangeTheme:
      return MaterialPageRoute(builder: (_) => const ChangeTheme());

    case RoutePath.Loading:
      return MaterialPageRoute(builder: (_) => const LoadingScreen());

    // case RoutePath.Otp:
    //   Map<String, String> arguments = settings.arguments;
    //   return MaterialPageRoute(
    //     builder: (_) => OtpScreen(
    //       email: arguments['email'],
    //       password: arguments['password'],
    //       name: arguments['name'],
    //     ),
    //   );

    default:
      return MaterialPageRoute(builder: (_) => const Wrapper());
  }
}
