import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/community_screen/community_screen.dart';

import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
  });

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();

    super.dispose();
  }

  //DATEPICKER
  Future<void> _selectDate(
      //for showing the picked date
      BuildContext context,
      TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

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
          style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: ColorConstant.DefaultBlue,
              fontSize: 22,
            ),
          ),
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
      body: Column(
        children: [Text("ofie")],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.DefaultBlue,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Select Community",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Title",
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 90,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: desController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Description",
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Start Date",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              await _selectDate(context, dateController);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: ColorConstant.DefaultBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Create",
                            style: TextStyle(
                                color: ColorConstant.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: ColorConstant.white,
        ),
      ),
    );
  }
}
