import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'home_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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
      case 3:
        return ProfileScreen();
      case 4:
        return SettingsScreen();
      default:
        return AddScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        backgroundColor: Color(0xFF3366FF),
      ),
      body: Center(
        child: Text(
          "Add Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
