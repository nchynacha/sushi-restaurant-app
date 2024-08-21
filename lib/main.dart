import 'package:flutter/material.dart';

import 'package:sushi/splashscreen.dart';
import 'package:sushi/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "/homepage": (context) => WelcomePage()
      },
      title: 'MENUS',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
