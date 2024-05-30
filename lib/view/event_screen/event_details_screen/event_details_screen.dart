import 'package:app_neu_social/database/chat_database.dart';
import 'package:app_neu_social/model/message.dart';
import 'package:app_neu_social/providers/user_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({
    super.key,
    required this.communityName,
    required this.description,
  });
  final String communityName;
  final String description;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  // final ChatUser currentUser = ChatUser(
  //   id: "1", // Change to the current user's ID
  //   firstName: "Current User",
  // );

  // final ChatUser otherUser = ChatUser(
  //   id: "2", // Change to the other user's ID
  //   firstName: "Other User",
  // );
  final TextEditingController _controller = TextEditingController();
  late Future<List<Message>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = _loadMessages();
  }

  Future<List<Message>> _loadMessages() async {
    final db = await ChatDatabase.instance.database;
    final maps = await db.query('messages', orderBy: 'timestamp DESC');

    return List.generate(maps.length, (i) {
      return Message.fromMap(maps[i]);
    });
  }

  void _sendMessage(BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    if (user == null) return;

    final messageText = _controller.text;
    if (messageText.isEmpty) return;

    final message = Message(
      username: user.username,
      message: messageText,
      timestamp: DateTime.now(),
    );

    final db = await ChatDatabase.instance.database;
    await db.insert('messages', message.toMap());

    setState(() {
      _messages = _loadMessages();
    });

    _controller.clear();
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', false);
    Provider.of<UserProvider>(context, listen: false).logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat screen",
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: ColorConstant.black,
                  fontSize: 22),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/splash.jpeg"),
              radius: 20,
              backgroundColor: Colors.amber,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: user != null
            ? Column(
                children: [
                  Expanded(
                    child: FutureBuilder<List<Message>>(
                      future: _messages,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No messages'));
                        }

                        final messages = snapshot.data!;

                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final isMe = message.username == user!.username;

                            return Align(
                              alignment: isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isMe
                                        ? Color.fromARGB(255, 134, 250, 138)
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: isMe
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message.username,
                                      style: GoogleFonts.josefinSans(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      message.message,
                                      style: GoogleFonts.dosis(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 300,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Enter message',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: ColorConstant.black,
                          ),
                          onPressed: () => _sendMessage(context),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: ColorConstant.DefaultBlue, width: 2)),
                        child: Text('please Login to join the chat'),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
