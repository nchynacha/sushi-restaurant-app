import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sushi/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _navigateToHome();
    });
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacementNamed('/homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightroseQuartzColor,
      body: Center(
        child: Image.asset(
          'assets/images/sushi-plate.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
