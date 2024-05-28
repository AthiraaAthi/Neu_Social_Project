import 'dart:async';

import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash.jpeg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Neu-Social",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
