import 'package:flutter/material.dart';
import 'package:quizify/widgets/custom_bottom_nav_bar.dart'; // Import the CustomBottomNavBar widget
import 'history_screen.dart'; // Import the HistoryScreen
import 'home_screen.dart'; // Import the HomeScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen
import 'package:quizify/widgets/custom_app_bar.dart'; // Import the CustomAppBar widget

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
        return AboutScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "About Us",
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png', // Replace with the correct path to your logo
                  height: 100,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "About Us",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "Welcome to QuiziFy, the innovative mobile application designed to enhance your daily life with cutting-edge technology and user-friendly features. Our mission is to bring convenience, efficiency, and enjoyment to your fingertips, revolutionizing the way you interact with your mobile device.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              SizedBox(height: 24.0),
              Text(
                "Who We Are",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "At University of Sri Jayawardhenepura technology Faculty, we are a dedicated team of tech enthusiasts, designers, and developers who are passionate about creating exceptional mobile experiences. With a diverse background in software engineering, user experience design, and digital marketing, we work tirelessly to deliver a product that not only meets but exceeds your expectations.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              SizedBox(height: 24.0),
              Text(
                "Our Commitment",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "We are committed to providing a seamless and enjoyable user experience. Our team continuously updates and improves the app based on your feedback and the latest technological advancements. We value your trust and strive to maintain the highest standards of quality, security, and customer service.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              SizedBox(height: 24.0),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "If you have any questions, feedback, or need assistance, please don’t hesitate to reach out to our support team at quizifyinfo@gmail.com. We are here to help!",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
