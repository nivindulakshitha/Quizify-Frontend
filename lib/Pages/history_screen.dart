import 'package:flutter/material.dart';
import '../widgets/category_button.dart'; // Import the CategoryButton widget
import '../widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'home_screen.dart'; // Import the HomeScreen
import 'add_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen
import 'package:quizify/widgets/custom_app_bar.dart';

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
        return HistoryScreen(); // Stay on HistoryScreen when index is 1
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3366FF),
      appBar: CustomAppBar(
        title: "History",
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.9, // Adjust to match your design
          ),
          itemCount: 6, // Number of quizzes
          itemBuilder: (context, index) {
            return CategoryButton(
              icon: Icons.public, // Example icon
              name: "XYZ Quiz",
              iconColor: Colors.blue,
              creationDate: "08.12.2024",
              onTap: () {
                // Handle button tap
              },
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
