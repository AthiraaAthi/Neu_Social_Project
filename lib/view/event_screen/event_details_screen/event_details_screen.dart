import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen(
      {super.key, required this.communityName, required this.description});
  final String communityName;
  final String description;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final List<ChatMessage> messages = [];
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final ChatUser currentUser = ChatUser(
    id: "1", // Change to the current user's ID
    firstName: "Current User",
  );

  final ChatUser otherUser = ChatUser(
    id: "2", // Change to the other user's ID
    firstName: "Other User",
  );

  void sendMessage(ChatMessage message) {
    setState(() {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat screen of ${widget.communityName}",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: ColorConstant.DefaultBlue),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/splash.jpeg"),
            radius: 20,
            backgroundColor: Colors.amber,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              currentUser: currentUser,
              messages: messages,
              onSend: sendMessage,
              inputOptions: InputOptions(
                sendOnEnter: true,
                alwaysShowSend: true,
                inputDecoration: InputDecoration(
                  hintText: "Type a message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              messageOptions: MessageOptions(
                  currentUserContainerColor: Color.fromARGB(255, 114, 185, 244),
                  currentUserTextColor: Colors.black,
                  containerColor: Colors.grey,
                  textColor: ColorConstant.black),
            ),
          ),
        ],
      ),
    );
  }
}
