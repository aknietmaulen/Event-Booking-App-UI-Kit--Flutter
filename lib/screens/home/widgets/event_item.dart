import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';

import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeEventItem extends StatelessWidget {
  final EventModel eventModel;

  HomeEventItem({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    // Format the event date
    final String day = DateFormat('dd').format(eventModel.date);
    final String month = DateFormat('MMMM').format(eventModel.date).toUpperCase();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      height: 250, // Set a fixed height for each event item
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150, // Set fixed height for image container
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Adjust the ratio as needed
                  child: Image.network(
                    eventModel.photo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: MyTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        day,
                        style: TextStyle(
                          color: MyTheme.customRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          color: MyTheme.customRed,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              eventModel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: MyTheme.grey,
                ),
                Text(
                  eventModel.place,
                  style: TextStyle(color: MyTheme.grey, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
