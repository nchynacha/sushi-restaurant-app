import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: kRoseQuartzColor,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'TABLE 1',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPurpleColor),
            ),
          ],
        ),
      ),
    );
  }
}
