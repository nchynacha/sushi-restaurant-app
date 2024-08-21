import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sushi-logo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                    color: kPurpleColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Enjoy your meal',
                style: TextStyle(color: kPurpleColor),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
                    shape: CircleBorder(),
                    backgroundColor: kPurpleColor
                    // Background color
                    ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
