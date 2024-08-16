import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'home_screen.dart'; // Import the HistoryScreen
import 'add_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
      case 2:
        return AddScreen();
      case 3:
        return ProfileScreen();
      case 4:
        return SettingsScreen();
      default:
        return HistoryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "History Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
