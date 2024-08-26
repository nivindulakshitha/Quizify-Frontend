import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'add_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'home_screen.dart'; // Import the HomeScreen
import 'aboutus_screen.dart'; // Import the AboutScreen
import 'logout_screen.dart'; // Import the LogoutScreen
import 'package:quizify/widgets/custom_app_bar.dart'; // Import the CustomAppBar widget

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  void _onTabSelected(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _getScreenFromIndex(index)),
    );
  }

  Widget _getScreenFromIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const HistoryScreen();
      case 2:
        return const AddScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const SettingsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingsItem(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingsItem(
              context,
              icon: Icons.dark_mode,
              title: 'Dark mode',
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingsItem(
              context,
              icon: Icons.info,
              title: 'About Us',
              onTap: () {
                // Navigate to the About Us screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.star,
              title: 'Rate Us',
              onTap: () {
                // Navigate to the Rate Us screen or trigger rating action
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Navigate to the Logout screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon,
      required String title,
      Widget? trailing,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      trailing:
          trailing ?? const Icon(Icons.arrow_forward_ios, color: Colors.black54),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      tileColor: Colors.white,
    );
  }
}
