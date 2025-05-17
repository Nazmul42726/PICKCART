import 'package:flutter/material.dart';
import 'home_page.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'notification_page.dart';
import 'main_page.dart'; // ✅ Add this

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PickCart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF9F6FC),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainPage(), // ✅ Use MainPage here
        '/notifications': (context) => const NotificationPage(), // optional if you use MainPage only
      },
    );
  }
}
