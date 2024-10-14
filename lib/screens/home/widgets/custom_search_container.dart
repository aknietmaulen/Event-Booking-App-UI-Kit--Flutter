import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/icons/ic_search.png'),
        ),
        Container(
          color: MyTheme.white.withOpacity(0.6),
          width: 1,
          height: 20,
          margin: EdgeInsets.symmetric(horizontal: 4),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(
                color: MyTheme.white.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: MyTheme.customLightBlue.withOpacity(1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/icons/ic_filter.png'),
              ),
              Text(
                'Filters',
                style: TextStyle(color: MyTheme.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
