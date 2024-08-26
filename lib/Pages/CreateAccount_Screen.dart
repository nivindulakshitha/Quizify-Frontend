import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizify/Services/api_service.dart';

class CreateAccountScreen extends StatelessWidget {

	// Text Editing Controllers for the Text Fields:nivindulakshitha
	final TextEditingController usernameController = TextEditingController();
	final TextEditingController emailController = TextEditingController();
	final TextEditingController passwordController = TextEditingController();

  CreateAccountScreen({super.key});

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
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Create An Account",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
						controller: usernameController, // Controller for the Username TextField:nivindulakshitha
                    decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "User",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
					controller: emailController, // Controller for the Email TextField:nivindulakshitha
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
					controller: passwordController, // Controller for the Password TextField:nivindulakshitha`
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
						// TODO: Form data validation should be done here
						
						try {
							// * I used the same SnackBar for both success and error messages, do modifications as needed
							// Make a POST request to the API:nivindulakshitha
							Map<String, dynamic> response = await postRequest('user/register', {
								'username': usernameController.text,
								'email': emailController.text,
								'password': passwordController.text,
							});

							if (response['success']) {
								// Show a SnackBar with a success message
								ScaffoldMessenger.of(context).showSnackBar(
									SnackBar(
										content: Text(response['message']),
										backgroundColor: Colors.green,
									),
								);
							} else {
								// Show a SnackBar with an error message
								ScaffoldMessenger.of(context).showSnackBar(
									SnackBar(
										content: Text(response['message']),
										backgroundColor: Colors.red,
									),
								);
							}
							
						} catch (error) {
							// Show a SnackBar with an error message
								ScaffoldMessenger.of(context).showSnackBar(
									const SnackBar(
										content: Text('An error occurred while processing your request'),
										backgroundColor: Colors.red,
									),
								);
							print('postRequest error: $error');
						}
					},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3366FF), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 124, vertical: 15),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Or, sign up with Social Media"),
                  const SizedBox(height: 15),

                  // Google and Facebook Sign-In Buttons in a Row
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
                      const Text("You have an already account "),
                      GestureDetector(
                        onTap: () {
                          // Navigate back to the Login screen
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Sign in",
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
