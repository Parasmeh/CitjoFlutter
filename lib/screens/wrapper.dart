import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/auth_repository.dart';
import '../routes/routes_path.dart';
import '../services/get_it_service.dart';
import '../services/navigation_service.dart';
import '../services/size_config.dart';
import '../stores/userStore.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  WrapperState createState() => WrapperState();
}

class WrapperState extends State<Wrapper> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await handleNavigation();
    });
  }

  handleNavigation() async {
    // await AuthRepository().signOut();
    // _navigationService.popAllAndNavigateTo(RoutePath.Home);
    // print('Inside handleNavigation');
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    // print('fetchAuthSession Complete');
    if (authSessions.isSignedIn) {
      // print('isSignedIn');
       UserStore().fetchCurrentUser();
      // print('fetchCurrentUser Complete');
       UserStore().fetchAllOtherUsers();
      // print('fetchAllOtherUsers Complete');
      // _navigationService.popAllAndReplace(RoutePath.Home);
      await Provider.of<UserStore>(context, listen: false).init();
      print('Init done');

      _navigationService.popAllAndNavigateTo(RoutePath.Home);
    } else {
      // print('Inside else');
      _navigationService.popAllAndNavigateTo(RoutePath.Login);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Building Wrapper Widget......');
    }
    SizeConfig().init(context);
    // return Dashboard();
    return const SafeArea(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
