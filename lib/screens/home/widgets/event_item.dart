import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  EventModel eventModel;
  EventItem({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // border: Border.all(color: MyTheme.grey),
                ),
                child: Image(
                  image: AssetImage(eventModel.image),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                margin: EdgeInsets.only(left: 8, top: 8),
                decoration: BoxDecoration(
                    color: MyTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text(
                      "10",
                      style: TextStyle(
                          color: MyTheme.customRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Text(
                      "NOVEMBER",
                      style: TextStyle(
                        color: MyTheme.customRed,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  margin: EdgeInsets.only(left: 8, top: 8),
                  decoration: BoxDecoration(
                      color: MyTheme.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(
                    Icons.bookmark,
                    color: MyTheme.customRed,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              eventModel.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Row(
            children: [
              SizedBox(width: 8),
            ],
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
                  eventModel.address,
                  style: TextStyle(color: MyTheme.grey, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
