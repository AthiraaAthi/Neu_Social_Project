// import 'package:app_neu_social/controller/community_provider.dart';
// import 'package:app_neu_social/utils/color_constant/color_constant.dart';
// import 'package:app_neu_social/view/event_screen/event_details_screen/event_details_screen.dart';
// import 'package:app_neu_social/view/event_screen/event_screen.dart';
// import 'package:app_neu_social/view/event_screen/event_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class CommunityScreen extends StatefulWidget {
//   const CommunityScreen({super.key});

//   @override
//   State<CommunityScreen> createState() => _CommunityScreenState();
// }

// class _CommunityScreenState extends State<CommunityScreen> {
//   List<String> Type = [
//     "Public",
//     "Private",
//     "Event-based",
//     "Invitation-Based",
//     "Paid"
//   ];
//   String dropDownValue = "Public";
//   final titleController = TextEditingController();
//   final desController = TextEditingController();
//   List<String> MyList = [];

//   @override
//   Widget build(BuildContext context) {
//     final eventProvider = Provider.of<EventProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundImage: AssetImage("assets/images/splash.jpeg"),
//             radius: 20,
//             backgroundColor: Colors.amber,
//           ),
//         ),
//         title: Text(
//           "Create Community",
//           style: GoogleFonts.dancingScript(
//             textStyle: TextStyle(
//               fontWeight: FontWeight.w900,
//               color: ColorConstant.DefaultBlue,
//               fontSize: 22,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorConstant.DefaultBlue,
//         onPressed: () {
//           showModalBottomSheet(
//             isScrollControlled: true,
//             context: context,
//             builder: (context) => Padding(
//               padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: Container(
//                 height: 400,
//                 width: 500,
//                 decoration: BoxDecoration(
//                   color: ColorConstant.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Create Community",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 22),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 300,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(5)),
//                       child: TextField(
//                         controller: titleController,
//                         decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Title",
//                             hintStyle:
//                                 TextStyle(fontSize: 15, color: Colors.grey),
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 300,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(5)),
//                       child: TextField(
//                         controller: desController,
//                         decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Description",
//                             hintStyle:
//                                 TextStyle(fontSize: 15, color: Colors.grey),
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     StatefulBuilder(
//                       builder: (context, CsetState) => Container(
//                         height: 50,
//                         width: 300,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 90),
//                           child: DropdownButton(
//                             underline: Container(),
//                             value: dropDownValue,
//                             items: Type.map<DropdownMenuItem<String>>(
//                                 (String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2),
//                                   child: Text(value),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (String? value) {
//                               CsetState(() {
//                                 dropDownValue = value!;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         eventProvider.addEvent(
//                           titleController.text,
//                           desController.text,
//                         );
//                         titleController.clear();
//                         desController.clear();
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 300,
//                         decoration: BoxDecoration(
//                             color: ColorConstant.DefaultBlue,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                           child: Text(
//                             "Create",
//                             style: TextStyle(
//                                 color: ColorConstant.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Icon(
//           Icons.add,
//           color: ColorConstant.white,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView.builder(
//           itemCount: eventProvider.events.length,
//           itemBuilder: (context, index) {
//             final event = eventProvider.events[index];
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: EventWidget(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EventDetailsScreen(
//                           communityName: event.communityName,
//                           description: event.description,
//                         ),
//                       ));
//                 },
//                 communityName: event.communityName,
//                 description: event.description,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_neu_social/controller/community_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/event_screen/event_details_screen/event_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_neu_social/view/event_screen/event_widget.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> Type = [
    "Public",
    "Private",
    "Event-based",
    "Invitation-Based",
    "Paid"
  ];
  String dropDownValue = "Public";
  final titleController = TextEditingController();
  final desController = TextEditingController();
  List<String> MyList = [];

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
          "Create Community",
          style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: ColorConstant.DefaultBlue,
              fontSize: 22,
            ),
          ),
        ),
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
                height: 400,
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
                        "Create Community",
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
                        controller: titleController,
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
                      height: 50,
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
                    StatefulBuilder(
                      builder: (context, CsetState) => Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: DropdownButton(
                            underline: Container(),
                            value: dropDownValue,
                            items: Type.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              CsetState(() {
                                dropDownValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        eventProvider.addEvent(
                          titleController.text,
                          desController.text,
                        );
                        titleController.clear();
                        desController.clear();
                        Navigator.pop(context);
                      },
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
                          description: event.description,
                        ),
                      ));
                },
                communityName: event.communityName,
                description: event.description,
              ),
            );
          },
        ),
      ),
    );
  }
}
