import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> _events = [];

  List<EventModel> get events => _events;

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
}
