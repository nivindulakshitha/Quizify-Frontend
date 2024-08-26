// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:quizify/Models/user_model.dart';
import 'create_quiz_screen.dart';
import 'join_quiz_screen.dart';
import 'package:quizify/Quiz_Screens/science_quiz_screen.dart'; // Import the ScienceQuizScreen
import 'package:quizify/Quiz_Screens/geography_quiz_screen.dart'; // Import the GeographyQuizScreen
import 'package:quizify/Quiz_Screens/sports_quiz_screen.dart'; // Import the SportsQuizScreen
import 'package:quizify/Quiz_Screens/biology_quiz_screen.dart'; // Import the BiologyQuizScreen
import 'all_quizzes_screen.dart'; // Import the AllQuizzesScreen
import 'package:quizify/widgets/category_button.dart'; // Import the CategoryButton widget
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget

import 'history_screen.dart'; // Import the HistoryScreen
import 'add_screen.dart'; // Import the AddScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen

import 'package:provider/provider.dart';
import 'package:quizify/Models/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1: // History
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HistoryScreen()),
        );
        break;
      case 2: // Add (Center Button)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AddScreen()),
        );
        break;
      case 3: // Profile
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
      case 4: // Settings
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    UserModel? user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color(0xFF3366FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '${user?.username}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ), 
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildFeatureCard(
                    context,
                    title: 'Create\nQuiz',
                    color: Colors.redAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateQuizScreen()),
                      );
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    title: 'Join in\nQuiz',
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JoinQuizScreen()),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Open Quizzes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllQuizzesScreen()),
                        );
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildQuizCategories(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title, required Color color, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCategories(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          CategoryButton(
            icon: Icons.science,
            name: 'Science Quiz 1',
            iconColor: Colors.redAccent,
            creationDate: '01 Aug 2024',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScienceQuizScreen()),
              );
            },
          ),
          CategoryButton(
            icon: Icons.public,
            name: 'Geography Quiz 1',
            iconColor: Colors.greenAccent,
            creationDate: '01 Aug 2024',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GeographyQuizScreen()),
              );
            },
          ),
          CategoryButton(
            icon: Icons.sports,
            name: 'Sports Quiz 1',
            iconColor: Colors.orangeAccent,
            creationDate: '01 Aug 2024',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SportsQuizScreen()),
              );
            },
          ),
          CategoryButton(
            icon: Icons.biotech,
            name: 'Biology Quiz 1',
            iconColor: Colors.blueAccent,
            creationDate: '01 Aug 2024',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BiologyQuizScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
