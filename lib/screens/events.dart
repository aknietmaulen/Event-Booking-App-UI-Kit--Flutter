import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/screens/home/widgets/event_item.dart';
import 'package:flutter/material.dart';
import '../../my_theme.dart';
import '../../models/event_model.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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

  var bottomBarItemSelectedIndex = 1; // Start on Events page

  void selectBottomBarItem(int index) {
    print(">> selectBottomBarItem : index = $index");
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
    // No need for navigation logic here since we're in EventsPage
  }

  final eventList = [
    EventModel(
      title: "Digital Bridge",
      image: "assets/images/upcomming_img1.png",
      going: 20,
      address: "EXPO Center",
    ),
    EventModel(
      title: "Nomad Games",
      image: "assets/images/upcomming_img2.png",
      going: 14,
      address: "Botanic Park",
    ),
    EventModel(
      title: "Egor Kreed Concert",
      image: "assets/images/upcomming_img3.png",
      going: 16,
      address: "Barys Arena",
    ),
    EventModel(
      title: "Conference HFIU",
      image: "assets/images/upcomming_img4.png",
      going: 18,
      address: "AITU",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Upcoming Events List displayed vertically
            ListView.builder(
              itemCount: eventList.length,
              padding: EdgeInsets.all(12),
              physics: NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
              shrinkWrap: true, // Allow the inner ListView to take up only the needed space
              itemBuilder: (ctx, index) {
                final eventModel = eventList[index];
                return EventItem(eventModel: eventModel);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              imagePath: bottomBarItemsDataList[0].image,
              title: bottomBarItemsDataList[0].title,
              isSelected: bottomBarItemSelectedIndex == 0,
              onTap: () {
                selectBottomBarItem(0);
              },
            ),
            BottomBarItem(
              imagePath: bottomBarItemsDataList[1].image,
              title: bottomBarItemsDataList[1].title,
              isSelected: bottomBarItemSelectedIndex == 1,
              onTap: () {
                selectBottomBarItem(1);
              },
            ),
            SizedBox(width: 30), // Spacing for FAB
            BottomBarItem(
              imagePath: bottomBarItemsDataList[2].image,
              title: bottomBarItemsDataList[2].title,
              isSelected: bottomBarItemSelectedIndex == 2,
              onTap: () {
                selectBottomBarItem(2);
              },
            ),
            BottomBarItem(
              imagePath: bottomBarItemsDataList[3].image,
              title: bottomBarItemsDataList[3].title,
              isSelected: bottomBarItemSelectedIndex == 3,
              onTap: () {
                selectBottomBarItem(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final Function onTap;

  BottomBarItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
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
              color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
            ),
            Text(
              title,
              style: TextStyle(
                color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
