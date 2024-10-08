import 'package:flutter/material.dart';
import 'package:quizify/Pages/Splash_Screen.dart';
import 'package:quizify/Pages/Login_Screen.dart';
import 'package:quizify/Pages/CreateAccount_Screen.dart';
import 'package:quizify/Pages/ForgotPassword_Screen.dart';
import 'package:quizify/Pages/CheckEmail_Screen.dart';
import 'package:provider/provider.dart';
import 'package:quizify/Models/user_provider.dart';
import 'package:quizify/Models/quiz_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuiziFy',
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Splash screen route
        '/login': (context) => LoginScreen(), // Login screen route
        '/createAccount': (context) =>
            CreateAccountScreen(), // Create Account screen route
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/checkEmail': (context) =>
            const CheckEmailScreen(), // Forgot Password screen route
      },
    );
  }
}
