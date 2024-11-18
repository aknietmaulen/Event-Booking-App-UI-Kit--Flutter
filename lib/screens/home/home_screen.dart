import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/screens/event_detail.dart';
import 'package:event_booking_app_ui/screens/events.dart';
import 'package:event_booking_app_ui/screens/map_page.dart';
import 'package:event_booking_app_ui/screens/profile_page.dart';
import 'package:flutter/material.dart';
import '../../my_theme.dart';
import './widgets/custom_app_bar.dart';
import './widgets/custom_search_container.dart';
import './widgets/top_container.dart';
import './widgets/home_event_item.dart';
import '../../models/event_model.dart';
import 'package:provider/provider.dart';
import '../../providers/event_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";
  String _selectedCategory = "";

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query.trim().toLowerCase();
    });
  }
  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;  // Set the selected category
    });
  }
  
  List<TabItemModel> tabItemsList = [
    TabItemModel(
      image: "assets/icons/sports.png",
      title: "Sport",
      backgroundColor: MyTheme.blueSport,
    ),
    TabItemModel(
      image: "assets/icons/nature.png",
      title: "Nature",
      backgroundColor: MyTheme.greenNature,
    ),
    TabItemModel(
      image: "assets/icons/enter.png",
      title: "Entertainment",
      backgroundColor: MyTheme.orangeEnter,
    ),
    TabItemModel(
      image: "assets/icons/emergency.png",
      title: "Emergency",
      backgroundColor: MyTheme.redEmer,
    ),
    TabItemModel(
      image: "assets/icons/formal.png",
      title: "Formal",
      backgroundColor: MyTheme.indiForm,
    ),
  ];

  var bottomBarItemSelectedIndex = 0;

  void selectBottomBarItem(int index) {
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetch events from provider
    final eventsProvider = Provider.of<EventsProvider>(context);
    eventsProvider.fetchEvents();
    final filteredEvents = _searchQuery.isEmpty
        ? (_selectedCategory.isEmpty
            ? eventsProvider.getUpcomingEvents()
            : eventsProvider.getEventsByCategory(_selectedCategory))
        : eventsProvider.events.where((event) {
            return event.name.toLowerCase().contains(_searchQuery) ||
                event.category.toLowerCase().contains(_searchQuery);
          }).toList();

    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopContainer(tabItemsList: tabItemsList, onSearch: _onSearch,onCategorySelected: _onCategorySelected),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                       _searchQuery.isEmpty
                          ? "Upcoming Volunteering Events"
                          : "Search Results",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  if (_searchQuery.isEmpty)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => EventsPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Text("See All"),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // Display events
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredEvents.length,
                itemBuilder: (ctx, index) {
                  final eventModel = filteredEvents[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsPage(event: eventModel),
                        ),
                      );
                    },
                    child: HomeEventItem(homeEventModel: eventModel),
                  );
                },
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "For you",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EventsPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Text("See All"),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Random Events List for "For You"
            SizedBox(
              height: 250,
              child: Consumer<EventsProvider>(
                builder: (context, provider, child) {
                  final randomEvents = provider.getRandomEvents();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: randomEvents.length,
                    itemBuilder: (ctx, index) {
                      final eventModel = randomEvents[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventDetailsPage(event: eventModel),
                            ),
                          );
                        },
                        child: HomeEventItem(homeEventModel: eventModel),
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 12),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              imagePath: "assets/icons/ic_explore.png",
              title: "Explore",
              isSelected: bottomBarItemSelectedIndex == 0,
              onTap: () {
                selectBottomBarItem(0);
              },
            ),
            BottomBarItem(
              imagePath: "assets/icons/ic_calendar.png",
              title: "Events",
              isSelected: bottomBarItemSelectedIndex == 1,
              onTap: () {
                selectBottomBarItem(1);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventsPage(),
                  ),
                );
              },
            ),
            SizedBox(width: 30), // Spacing for FAB
            BottomBarItem(
              imagePath: "assets/icons/ic_location_marker.png",
              title: "Map",
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
              imagePath: "assets/icons/ic_profile.png",
              title: "Profile",
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
      onTap: () => onTap.call(),
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
            ),
          ],
        ),
      ),
    );
  }
}
