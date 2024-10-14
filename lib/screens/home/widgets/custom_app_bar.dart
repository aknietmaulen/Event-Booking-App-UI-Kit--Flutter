import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage("assets/icons/ic_menu.png")),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(color: MyTheme.white.withOpacity(0.6)),
                  ),
                  Icon(Icons.arrow_drop_down, color: MyTheme.white)
                ],
              ),
              Text(
                "New Yourk, USA",
                style: TextStyle(color: MyTheme.white),
              )
            ],
          ),
        ),
        Image(image: AssetImage("assets/icons/ic_notification.png")),
      ],
    );
  }
}
