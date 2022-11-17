import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Theme/dark_theme.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'routes/routes_generator.dart';
import 'routes/routes_path.dart';
import 'screens/Settings/thememanager.dart';
import 'screens/wrapper.dart';
import 'services/get_it_service.dart';
import 'services/navigation_service.dart';
import 'stores/auth.dart';
import 'stores/feed_store.dart';
import 'stores/notification_store.dart';
import 'stores/userStore.dart';

void main() {
  GetItService.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    print('Amplify Configured');
  }

  final _amplifyDataStore = AmplifyDataStore(
    modelProvider: ModelProvider.instance,
    // errorHandler: ((error) {
    //   print('Custom ErrorHandler received: $error');
    // }),
    // conflictHandler: (ConflictData data) {
    //   final localData = data.local;
    //   final remoteData = data.remote;
    //
    //   if (localData is User && remoteData is User) {
    //     final mergedPostData = User(
    //       // always favor the userType from the remote User data
    //       location: localData.location,
    //       userType: remoteData.userType,
    //     );
    //
    //     return ConflictResolutionDecision.retry(mergedPostData);
    //   }
    //
    //   return ConflictResolutionDecision.applyRemote();
    // },
    // // Sync configuration defaults:
    // syncInterval: 1,
    // syncMaxRecords: 10000,
    // syncPageSize: 1000,
  );

  void _configureAmplify() async {
    try {
      await Amplify.addPlugins([
        _amplifyDataStore,
        AmplifyAuthCognito(),
        AmplifyAPI(),
        AmplifyStorageS3()
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Tried to reconfigure Amplify; '
            'this can occur when your app restarts on Android.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
          lazy: false,
        ),
        ChangeNotifierProvider<AuthStore>(
          create: (_) => AuthStore(),
          lazy: false,
        ),
        ChangeNotifierProvider<FeedStore>(
          create: (_) => FeedStore(),
          lazy: false,
        ),
        ChangeNotifierProvider<NotificationStore>(
          create: (_) => NotificationStore(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifier>(context).getTheme(),
        darkTheme: dark_theme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: _amplifyConfigured
            ? const Wrapper()
            : const CircularProgressIndicator(),
        navigatorKey: get_it_instance_const<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: RoutePath.Home,
      ),
    );
  }
}
