import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/get_it_service.dart';
import '../../services/navigation_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  NavigationService _navigationService =
      get_it_instance_const<NavigationService>();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),

      vsync: this,
      // duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    );
    _animationController.forward();
    super.initState();
    // Timer(
    //     Duration(seconds: 2),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => OnboardingScreen())));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      // backgroundColor: Color(0xFFE81667),
      body: Container(
        child: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
              height: 100,
              // width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
