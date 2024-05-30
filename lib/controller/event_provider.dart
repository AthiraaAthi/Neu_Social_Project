import 'package:app_neu_social/database/event2_dabase.dart';
import 'package:flutter/material.dart';

class Event2 {
  final String name;
  final String description;
  final String time;
  final String date;
  final String selectedCommunity;

  Event2({
    required this.name,
    required this.description,
    required this.time,
    required this.date,
    required this.selectedCommunity,
  });
}

class Event2Provider extends ChangeNotifier {
  List<Event2> _events = [];
  List<Event2> get events => _events;

  Future<void> addEvent2(
    String name,
    String description,
    String time,
    String date,
    String selectedCommunity,
  ) async {
    await Event2Database().addEvent2(
      name,
      description,
      time,
      date,
      selectedCommunity,
    );
    _events = await getEventsFromDatabase();
    notifyListeners();
  }

  Future<List<Event2>> getEventsFromDatabase() async {
    final eventMaps = await Event2Database().getEvents();
    return List.generate(eventMaps.length, (i) {
      return Event2(
        name: eventMaps[i]['name'],
        description: eventMaps[i]['description'],
        time: eventMaps[i]['time'],
        date: eventMaps[i]['date'],
        selectedCommunity: eventMaps[i]['selectedCommunity'],
      );
    });
  }

  Future<void> loadEvents2() async {
    _events = await getEventsFromDatabase();
    notifyListeners();
  }
}
