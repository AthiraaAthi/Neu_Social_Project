import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/community_screen/community_screen.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/splash.jpeg"),
              radius: 20,
              backgroundColor: Colors.amber,
            ),
          ),
          title: Text(
            "Neu-Social",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: ColorConstant.DefaultBlue),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityScreen(),
                      ));
                },
                icon: Icon(
                  Icons.add,
                  color: ColorConstant.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(),
        ));
  }
}
