import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3366FF),
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside of text fields
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "xxx@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You forgot your password  "),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Forgot Password screen
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the HomeScreen when login button is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3366FF), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 124, vertical: 15),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Or, Login with Social Media"),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: IconButton(
                          onPressed: () {
                            // Implement Google Sign-In functionality
                          },
                          icon: Image.asset('assets/google.png'),
                          iconSize: 50,
                          padding: EdgeInsets.all(0),
                          splashRadius: 30,
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: IconButton(
                          onPressed: () {
                            // Implement Facebook Sign-In functionality
                          },
                          icon: Image.asset('assets/Facebook.png'),
                          iconSize: 50,
                          padding: EdgeInsets.all(0),
                          splashRadius: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You didn’t have an account yet? "),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Create Account screen
                          Navigator.pushNamed(context, '/createAccount');
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
