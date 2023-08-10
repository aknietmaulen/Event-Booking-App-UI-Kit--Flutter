import 'dart:math';

import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../my_theme.dart';
import './widgets/custom_app_bar.dart';
import './widgets/custom_search_container.dart';
import './widgets/top_container.dart';
import './widgets/event_item.dart';
import '../../models/event_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabItemsList = [
    TabItemModel(
      image: "assets/icons/ic_sports.png",
      title: "Sports",
      backgroundColor: MyTheme.customRed,
    ),
    TabItemModel(
      image: "assets/icons/ic_music.png",
      title: "Music",
      backgroundColor: MyTheme.customYellowWithOrangeShade,
    ),
    TabItemModel(
      image: "assets/icons/ic_food.png",
      title: "Food",
      backgroundColor: MyTheme.foodTabItemColor,
    ),
    TabItemModel(
      image: "assets/icons/ic_art.png",
      title: "Arts",
      backgroundColor: MyTheme.customRed,
    ),
  ];

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

  var bottomBarItemSelectedIndex = 0;

  void selectBottomBarItem(int index) {
    print(">> selectBottomBarItem : index = $index");
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
  }

  final eventList = [
    EventModel(
      title: "International Band Meu....",
      image: "assets/images/upcomming_img1.png",
      going: 20,
      address: "36 Guild Street London, UK",
    ),
    EventModel(
      title: "International Band Meu....",
      image: "assets/images/upcomming_img2.png",
      going: 14,
      address: "37 Guild Street London, UK",
    ),
    EventModel(
      title: "International Band Meu....",
      image: "assets/images/upcomming_img3.png",
      going: 16,
      address: "38 Guild Street London, UK",
    ),
    EventModel(
      title: "International Band Meu....",
      image: "assets/images/upcomming_img4.png",
      going: 18,
      address: "39 Guild Street London, UK",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TopContainer
          TopContainer(tabItemsList: tabItemsList),
          // UpcomingEvents Container
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Upcoming Events",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Text("See All"),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
          // Upcoming Events List
          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final eventModel = eventList[index];
                return EventItem(eventModel: eventModel);
              },
              itemCount: eventList.length,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_box,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
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
            SizedBox(width: 30),
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
  String imagePath;
  String title;
  bool isSelected;
  Function onTap;

  BottomBarItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.isSelected,
      required this.onTap});

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
                  color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey),
            )
          ],
        ),
      ),
    );
  }
}

class TabItemsList extends StatelessWidget {
  const TabItemsList({
    super.key,
    required this.tabItemsList,
  });

  final List<TabItemModel> tabItemsList;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      height: 40,
      // width: double.infinity,
      width: query.size.width,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final item = tabItemsList[index];
          return TabItem(
            image: item.image,
            title: item.title,
            backgroundColor: item.backgroundColor,
          );
        },
        itemCount: tabItemsList.length,
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  String image;
  String title;
  Color backgroundColor;
  TabItem({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage('$image'),
          ),
          SizedBox(width: 8),
          Text(
            "$title",
            style: TextStyle(color: MyTheme.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
