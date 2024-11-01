import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class EventsProvider with ChangeNotifier {
  List<EventModel> _events = [];

  List<EventModel> get events => _events;
  List<EventModel>? _randomEvents;  // Store selected random events here


  Future<void> fetchEvents() async {
    try {
      // Fetching events from Firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events').get();
      _events = snapshot.docs.map((doc) => EventModel.fromFirestore(doc)).toList();
      notifyListeners(); // Notify listeners about the event update
    } catch (error) {
      // Handle errors here (e.g., log them, show a message to the user)
      print('Error fetching events: $error');
    }
  }
  // Get the 4 closest upcoming events by date
  List<EventModel> getUpcomingEvents() {
    DateTime now = DateTime.now();
    List<EventModel> upcomingEvents = _events
        .where((event) => event.date.isAfter(now))
        .toList();
    
    // Sort and take the first 4
    upcomingEvents.sort((a, b) => a.date.compareTo(b.date));
    return upcomingEvents.take(4).toList();
  }

    // Get 4 random events
  // Get 4 random events without altering the order of the list
  List<EventModel> getRandomEvents() {
    if (_randomEvents == null && _events.length >= 4) {
      final random = Random();
      _randomEvents = List<EventModel>.generate(4, (_) {
        int randomIndex = random.nextInt(_events.length);
        return _events[randomIndex];
      });
    }
    return _randomEvents ?? [];
  }

}
