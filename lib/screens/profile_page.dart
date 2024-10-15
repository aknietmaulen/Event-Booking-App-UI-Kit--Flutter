import 'package:flutter/material.dart';
import '../../my_theme.dart'; // Assuming MyTheme is your custom theme provider

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var bottomBarItemSelectedIndex = 3; // Start on Profile page

  void selectBottomBarItem(int index) {
    print(">> selectBottomBarItem : index = $index");
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
    // Add navigation logic based on selected index
    if (index != 3) {
      Navigator.pop(context); // Go back to the previous page (home)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/prof.png'), // Ensure this path matches your assets
            ),
            const SizedBox(height: 16),

            // User Name
            const Text(
              'No Name', // Replace with actual name later
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                // Add edit profile logic here
              },
              icon: const Icon(Icons.edit, color: Colors.green),
              label: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.green),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ), backgroundColor: Colors.white, // Background color
                side: const BorderSide(color: Colors.green), // Border color
              ),
            ),
            const SizedBox(height: 24),

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
              'Lorem ipsum dolor sit amet consectetur. Dui nisl ornare pellentesque a egestas pellentesque sit blandit turpis. Porttitor felis vitae ac viverra felis id.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Sign Out Button
            ElevatedButton.icon(
              onPressed: () {
                // Add sign-out logic here
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.customBlue1, // Button color
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // BottomBarItem definitions
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
              },
            ),
            BottomBarItem(
              imagePath: "assets/icons/ic_location_marker.png",
              title: "Map",
              isSelected: bottomBarItemSelectedIndex == 2,
              onTap: () {
                selectBottomBarItem(2);
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
        margin: const EdgeInsets.only(top: 6),
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
