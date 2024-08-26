import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'home_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen
import 'package:quizify/widgets/custom_app_bar.dart'; // Import the CategoryButton widget

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

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
        return const HomeScreen();
      case 1:
        return const HistoryScreen();
      case 3:
        return const ProfileScreen();
      case 4:
        return const SettingsScreen();
      default:
        return const AddScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Quizes",
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: const Center(
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
