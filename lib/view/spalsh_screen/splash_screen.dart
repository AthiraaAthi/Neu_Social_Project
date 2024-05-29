import 'dart:async';

import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/Navigation/nav_screen.dart';
import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:app_neu_social/view/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final isLogged = await prefs.getBool("isLogged");
        print(isLogged);
        if (isLogged == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      },
    );
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
              style: GoogleFonts.dancingScript(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    color: ColorConstant.DefaultBlue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
