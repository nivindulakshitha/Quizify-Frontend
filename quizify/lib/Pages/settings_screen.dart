import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'add_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'home_screen.dart'; // Import the SettingsScreen


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      case 3:
        return ProfileScreen();
      default:
        return SettingsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Settings Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
