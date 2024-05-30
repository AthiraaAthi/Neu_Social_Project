import 'package:app_neu_social/database/database_service.dart';
import 'package:flutter/material.dart';

class Event {
  final String communityName;
  final String description;

  Event({required this.communityName, required this.description});
}

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> get events => _events;

  Future<void> addEvent(String communityName, String description) async {
    await DatabaseService().addEvent(communityName, description);
    _events = await getEventsFromDatabase();
    notifyListeners();
  }

  Future<List<Event>> getEventsFromDatabase() async {
    final eventMaps = await DatabaseService().getEvents();
    return List.generate(eventMaps.length, (i) {
      return Event(
        communityName: eventMaps[i]['communityName'],
        description: eventMaps[i]['description'],
      );
    });
  }

  Future<void> loadEvents() async {
    _events = await getEventsFromDatabase();
    notifyListeners();
  }
}
