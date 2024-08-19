import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'add_screen.dart'; // Import the AddScreen
import 'home_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onTabSelected(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _getScreenFromIndex(index)),
    );
  }

  Widget _getScreenFromIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return HistoryScreen();
      case 2:
        return AddScreen();
      case 4:
        return SettingsScreen();
      default:
        return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
