import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String category;
  final DateTime date;
  final String description;
  final GeoPoint location;
  final String name;
  final String photo;
  final String place;

  EventModel({
    required this.category,
    required this.date,
    required this.description,
    required this.location,
    required this.name,
    required this.photo,
    required this.place,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EventModel(
      category: data['category'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      description: data['description'] ?? '',
      location: data['location'] ?? GeoPoint(0, 0),
      name: data['name'] ?? '',
      photo: data['photo'] ?? '',
      place: data['place'] ?? '',
    );
  }
}
