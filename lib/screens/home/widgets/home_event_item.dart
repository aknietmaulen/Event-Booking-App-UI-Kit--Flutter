import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeEventItem extends StatelessWidget {
  final EventModel homeEventModel;

  HomeEventItem({
    Key? key,
    required this.homeEventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the event date
    final String day = DateFormat('dd').format(homeEventModel.date);
    final String month = DateFormat('MMMM').format(homeEventModel.date).toUpperCase();

    return Container(
      width: 240, // Fixed width for each event item
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 240, // Ensure image container matches the set width
                height: 160, // Set fixed height for image
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Image.network(
                  homeEventModel.photo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                          fontSize: 15, // Smaller font size for day
                        ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          color: MyTheme.customRed,
                          fontSize: 10, // Smaller font size for month
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              homeEventModel.name,
              maxLines: 1, // Limit to one line to prevent overflow
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: MyTheme.grey,
                  size: 16,
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    homeEventModel.place,
                    style: TextStyle(color: MyTheme.grey, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
