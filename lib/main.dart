import 'package:app_neu_social/controller/event_provider.dart';
import 'package:app_neu_social/providers/user_provider.dart';
import 'package:app_neu_social/view/spalsh_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NeuSocial());
}

class NeuSocial extends StatelessWidget {
  const NeuSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => EventProvider()..loadEvents()),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
