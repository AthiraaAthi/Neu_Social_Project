import 'package:app_neu_social/controller/community_provider.dart';
import 'package:app_neu_social/controller/event_provider.dart';
import 'package:app_neu_social/providers/color_provider.dart';
import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/community_screen/community_screen.dart';

import 'package:app_neu_social/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Event2> events2 = [];
  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    desController.dispose();

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

  //TIME PICKER
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  void initState() {
    events2 = Provider.of<Event2Provider>(context, listen: false).events;
    super.initState();
  }

  void _addEvent(Event2 newEvent) async {
    await Provider.of<Event2Provider>(context, listen: false).addEvent2(
      newEvent.name,
      newEvent.description,
      newEvent.time,
      newEvent.date,
      newEvent.selectedCommunity,
    );
    setState(() {
      events2 = Provider.of<Event2Provider>(context, listen: false).events;
    });
  }

  String selectedCommunity = '';
  @override
  Widget build(BuildContext context) {
    final event2Provider = Provider.of<EventProvider>(context);
    final communityNames =
        event2Provider.events.map((e) => e.communityName).toList();
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
                      child: SingleChildScrollView(
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
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children:
                                  List.generate(communityNames.length, (index) {
                                final communityName = communityNames[index];

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCommunity = communityName;
                                    });
                                    Provider.of<ColorProvider>(context,
                                            listen: false)
                                        .toggleColor(index);
                                  },
                                  child: Consumer<ColorProvider>(
                                    builder: (context, colorProvider, child) {
                                      final isSelected =
                                          colorProvider.selectedIndex == index;
                                      return Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Color.fromARGB(255, 46, 227, 49)
                                              : ColorConstant.DefaultBlue,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.groups,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                communityName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
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
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
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
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      await _selectDate(
                                          context, dateController);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await _selectTime(context);
                                    },
                                    child: Center(
                                      child: Text(
                                        selectedTime != null
                                            ? ' ${_formatTime(selectedTime!)}'
                                            : 'Select Time',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                String Name = nameController.text;

                                String description = desController.text;
                                String date = dateController.text;
                                String time = selectedTime != null
                                    ? _formatTime(selectedTime!)
                                    : '';

                                Event2 event2 = Event2(
                                    name: Name,
                                    description: description,
                                    time: time,
                                    date: date,
                                    selectedCommunity: selectedCommunity);
                                _addEvent(event2);
                                nameController.clear();
                                desController.clear();
                                dateController.clear();
                                setState(() {
                                  selectedTime = null;
                                  selectedCommunity = '';
                                });

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
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: ColorConstant.black,
              )),
          IconButton(
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.setBool('isLogged', false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                });
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: events2.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //height: 170,
              decoration: BoxDecoration(
                color: ColorConstant.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/splash.jpeg"),
                          radius: 25,
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          events2[index].name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.DefaultBlue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          events2[index].description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Community:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " ${events2[index].selectedCommunity}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: ColorConstant.DefaultBlue),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          events2[index].time,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.red),
                        ),
                        Text(
                          events2[index].date,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
