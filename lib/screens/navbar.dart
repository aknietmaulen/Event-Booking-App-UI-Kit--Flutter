import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../my_theme.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:event_booking_app_ui/screens/events.dart';
import 'package:event_booking_app_ui/screens/map_page.dart';
import 'package:event_booking_app_ui/screens/profile_page.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex; // Track the selected index
  const Navbar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final bottomBarItemsDataList = [
    TabItemModel(
      image: "assets/icons/ic_explore.png",
      title: "Explore",
      backgroundColor: MyTheme.customRed,
    ),
    TabItemModel(
      image: "assets/icons/ic_calendar.png",
      title: "Events",
      backgroundColor: MyTheme.customYellowWithOrangeShade,
    ),
    TabItemModel(
      image: "assets/icons/ic_location_marker.png",
      title: "Map",
      backgroundColor: MyTheme.foodTabItemColor,
    ),
    TabItemModel(
      image: "assets/icons/ic_profile.png",
      title: "Profile",
      backgroundColor: MyTheme.customRed,
    ),
  ];

  // Navigate based on the selected item
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => EventsPage()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(bottomBarItemsDataList.length, (index) {
          final item = bottomBarItemsDataList[index];
          return BottomBarItem(
            imagePath: item.image,
            title: item.title,
            isSelected: widget.selectedIndex == index,
            onTap: () {
              _onItemTapped(index);
            },
          );
        }),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final Function onTap;

  const BottomBarItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              width: 24,
              height: 24,
              image: AssetImage(imagePath),
              color: isSelected ? MyTheme.customBlue1 : MyTheme.grey,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? MyTheme.customBlue1 : MyTheme.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
