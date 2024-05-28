import 'package:app_neu_social/view/spalsh_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NeuSocial());
}

class NeuSocial extends StatelessWidget {
  const NeuSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
