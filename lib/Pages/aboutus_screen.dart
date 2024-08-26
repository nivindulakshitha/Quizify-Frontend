import 'package:flutter/material.dart';
import 'history_screen.dart'; // Import the HistoryScreen
import 'home_screen.dart'; // Import the HomeScreen
import 'profile_screen.dart'; // Import the ProfileScreen
import 'settings_screen.dart'; // Import the SettingsScreen
import 'package:quizify/widgets/custom_app_bar.dart'; // Import the CustomAppBar widget

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

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
        return const HomeScreen();
      case 1:
        return const HistoryScreen();
      case 3:
        return const ProfileScreen();
      case 4:
        return const SettingsScreen();
      default:
        return const AboutScreen();
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
              const SizedBox(height: 24.0),
              const Text(
                "About Us",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                "Welcome to QuiziFy, the innovative mobile application designed to enhance your daily life with cutting-edge technology and user-friendly features. Our mission is to bring convenience, efficiency, and enjoyment to your fingertips, revolutionizing the way you interact with your mobile device.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              const SizedBox(height: 24.0),
              const Text(
                "Who We Are",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                "At University of Sri Jayawardhenepura technology Faculty, we are a dedicated team of tech enthusiasts, designers, and developers who are passionate about creating exceptional mobile experiences. With a diverse background in software engineering, user experience design, and digital marketing, we work tirelessly to deliver a product that not only meets but exceeds your expectations.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              const SizedBox(height: 24.0),
              const Text(
                "Our Commitment",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                "We are committed to providing a seamless and enjoyable user experience. Our team continuously updates and improves the app based on your feedback and the latest technological advancements. We value your trust and strive to maintain the highest standards of quality, security, and customer service.",
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              const SizedBox(height: 24.0),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
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
