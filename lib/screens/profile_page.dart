import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/my_theme.dart';
import 'package:event_booking_app_ui/screens/edit_profile_screen.dart';
import 'package:event_booking_app_ui/screens/events.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:event_booking_app_ui/screens/map_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _profileURL = '';

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
  
  var bottomBarItemSelectedIndex = 3;

  void selectBottomBarItem(int index) {
    print(">> selectBottomBarItem : index = $index");
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = await Provider.of<AuthProvider>(context, listen: false).getUserData();
    if (userData != null) {
      setState(() {
        _name = userData['name'] ?? '';
        _profileURL = userData['profileURL'] ?? '';
      });
    }
  }

  void _editProfile() {
    // Add logic to edit profile (show a dialog or navigate to an edit screen)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(_profileURL.isNotEmpty ? _profileURL : 'https://erms.bugemauniv.ac.ug/student/image/user_icon.png'), // Default image if URL is empty
            ),
            const SizedBox(height: 16),

            // User Name
            Text(
              _name.isNotEmpty ? _name : 'No Name', // Show name or fallback
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()), // Navigate to EditProfileScreen
                );
              },
              icon: const Icon(Icons.edit, color: Colors.green),
              label: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.green),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                backgroundColor: Colors.white, // Background color
                side: const BorderSide(color: Colors.green), // Border color
              ),
            ),

            // About Me Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Placeholder text for About Me
            const Text(
              'I’m here to help make a difference by volunteering in my community. I enjoy working with others to support local projects and want to do what I can to make things better',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Sign Out Button
            ElevatedButton.icon(
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacementNamed(context, '/login'); // Redirect to login after logout
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color
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
                // Navigate to the Events Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      //savedEvents: eventList, // Pass the saved events here
                    ),
                  ),
                );
              },
            ),
            BottomBarItem(
              imagePath: "assets/icons/ic_calendar.png",
              title: "Events",
              isSelected: bottomBarItemSelectedIndex == 1,
              onTap: () {
                selectBottomBarItem(1);

                // Navigate to the Events Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventsPage(
                      //savedEvents: eventList, // Pass the saved events here
                    ),
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
                    builder: (context) => MapPage(
                      //savedEvents: eventList, // Pass the saved events here
                    )
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
