import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';

class HomeEventItem extends StatelessWidget {
  final EventModel homeEventModel;

  HomeEventItem({
    Key? key,
    required this.homeEventModel,
  }) : super(key: key);

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
                ),
                child: Image.network(
                  homeEventModel.photo,
                  fit: BoxFit.cover,
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
                        homeEventModel.date.day.toString(),
                        style: TextStyle(
                          color: MyTheme.customRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        homeEventModel.date.month.toString().toUpperCase(),
                        style: TextStyle(
                          color: MyTheme.customRed,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: MyTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: MyTheme.customRed,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              homeEventModel.name,
              style: TextStyle(
                fontSize: 18,
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
                SizedBox(width: 4),
                Text(
                  homeEventModel.place,
                  style: TextStyle(color: MyTheme.grey, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
