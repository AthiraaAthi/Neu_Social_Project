import 'package:app_neu_social/controller/event_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/community_screen/community_screen.dart';
import 'package:app_neu_social/view/event_screen/event_details_screen/event_details_screen.dart';
import 'package:app_neu_social/view/event_screen/event_widget.dart';
import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: eventProvider.events.length,
            itemBuilder: (context, index) {
              final event = eventProvider.events[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: EventWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(
                              communityName: event.communityName,
                              description: event.description),
                        ));
                  },
                  communityName: event.communityName,
                  description: event.description,
                ),
              );
            },
          ),
        ));
  }
}
