import 'package:event_booking_app_ui/screens/edit_profile_screen.dart';
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
      appBar: AppBar(title: const Text('Profile')),
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
              'Lorem ipsum dolor sit amet consectetur. Dui nisl ornare pellentesque a egestas pellentesque sit blandit turpis. Porttitor felis vitae ac viverra felis id.',
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
    );
  }
}
