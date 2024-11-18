import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:event_booking_app_ui/screens/home/widgets/custom_app_bar.dart';
import 'package:event_booking_app_ui/screens/home/widgets/custom_search_container.dart';
import 'package:event_booking_app_ui/screens/map_page.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final List<TabItemModel> tabItemsList;
  final Function(String) onSearch;
  final Function(String) onCategorySelected;  // New parameter

  const TopContainer({
    super.key,
    required this.tabItemsList,
    required this.onSearch,
    required this.onCategorySelected,  // Pass it here

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        color: MyTheme.primaryColor,
      ),
      padding: EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(),
              CustomSearchContainer(onSearch: onSearch),
            ],
          ),
          Positioned(
            bottom: -30,
            child: TabItemsList(tabItemsList: tabItemsList, onCategorySelected: onCategorySelected, ),
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
    required this.onCategorySelected, 
  });

  final List<TabItemModel> tabItemsList;
  final Function(String) onCategorySelected; 

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      height: 40,
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
            onTap: onCategorySelected,
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
  final Function(String) onTap; 
  TabItem({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title), // Trigger the onTap with the category title
        child: Container(
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
              image: AssetImage(image),
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}