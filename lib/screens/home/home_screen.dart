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
          SizedBox(height: 0),

          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Upcoming Events",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
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
                ),
                // Invite Your Fiends
                Container(
                  width: double.infinity,
                  // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color:
                        MyTheme.inviteTheFriendContainerColor.withOpacity(0.16),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Invite your friends",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Get \$20 for ticket",
                                style: TextStyle(
                                    color: MyTheme.black.withOpacity(0.7)),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: MyTheme.inviteButtonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Text(
                                  "INVITE",
                                  style: TextStyle(
                                      color: MyTheme.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          height: 140,
                          image: AssetImage(
                              'assets/images/img_inviate_your_friend.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nearby You",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text("See All"),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
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