import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen
import 'package:quizify/Services/api_service.dart'; // Import the API service
import 'package:provider/provider.dart'; // Import the Provider package
import 'package:quizify/Models/user_model.dart';
import 'package:quizify/Models/user_provider.dart'; // Import the UserProvider

class LoginScreen extends StatelessWidget {
  // Text Editing Controllers for the Text Fields:nivindulakshitha
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3366FF),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller:
                        emailController, // Controller for the Email TextField:nivindulakshitha
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "xxx@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller:
                        passwordController, // Controller for the Password TextField:nivindulakshitha
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You forgot your password"),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Forgot Password screen
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                        child: const Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      // * I used the same SnackBar for both success and error messages, do modifications as needed
                      // Send a POST request to the API to log in the user

                      try {
                        Map<String, dynamic> response =
                            await postRequest('user/login', {
                          'email': emailController.text,
                          'password': passwordController.text,
                        });

                        if (response['success']) {
                          UserModel user = UserModel.fromJson(response['data']);
                          await Provider.of<UserProvider>(context,
                                  listen: false)
                              .saveUserToPrefs(user);

                          // Display a success message to the user
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          // Display an error message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid email or password"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } catch (error) {
						print('Error: $error');
                        // Display an error message to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "An error occurred while processing your request"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3366FF), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 124, vertical: 15),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Or, Login with Social Media"),
                  const SizedBox(height: 15),
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
                          padding: const EdgeInsets.all(0),
                          splashRadius: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: IconButton(
                          onPressed: () {
                            // Implement Facebook Sign-In functionality
                          },
                          icon: Image.asset('assets/Facebook.png'),
                          iconSize: 50,
                          padding: const EdgeInsets.all(0),
                          splashRadius: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You didn’t have an account yet? "),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Create Account screen
                          Navigator.pushNamed(context, '/createAccount');
                        },
                        child: const Text(
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
