import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;
  

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    DateTime adjustedDateTime = event.date.add(Duration(hours: 5));

    // Format the adjusted DateTime
    String formattedDate = DateFormat('MMMM d, yyyy').format(adjustedDateTime);
    String formattedTime = DateFormat('h:mm a').format(adjustedDateTime);
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Image.network(event.photo, fit: BoxFit.cover),
            SizedBox(height: 16),
            
            // Event Title
            Text(
              event.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Event Date
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  '$formattedDate, $formattedTime',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Event Location
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  event.place,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),

            // About Event
            Text(
              'About Event',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              event.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),

            // Join Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle join event action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Join In", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
