import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/providers/event_provider.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:event_booking_app_ui/screens/home/widgets/event_item.dart';
import 'package:event_booking_app_ui/screens/map_page.dart';
import 'package:event_booking_app_ui/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';

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
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch events when the widget initializes
    Provider.of<EventsProvider>(context, listen: false).fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventsProvider>(context);
    final eventList = eventsProvider.events;

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        automaticallyImplyLeading: false,
      ),
      body: eventList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: ListView.builder(
              itemCount: eventList.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                final eventModel = eventList[index];
                return HomeEventItem(eventModel: eventModel);
              },
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapPage(),
                  ),
                );
              },
            ),
            BottomBarItem(
              imagePath: bottomBarItemsDataList[3].image,
              title: bottomBarItemsDataList[3].title,
              isSelected: bottomBarItemSelectedIndex == 3,
              onTap: () {
                selectBottomBarItem(3);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
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
        width: 60, // Set a fixed width for equal sizing
        padding: EdgeInsets.symmetric(vertical: 8), // Consistent padding for all items
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 24,
              height: 24,
              image: AssetImage(imagePath),
              color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
            ),
            SizedBox(height: 4), // Space between icon and text
            Text(
              title,
              style: TextStyle(
                fontSize: 12, // Ensure consistent font size for all text labels
                color: isSelected ? MyTheme.customBlue1 : MyTheme.grey,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
