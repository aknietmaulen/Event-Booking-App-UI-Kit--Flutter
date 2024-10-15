import 'package:event_booking_app_ui/screens/onboarding1_screen.dart';
import 'package:event_booking_app_ui/screens/signin_screen.dart';
import 'package:event_booking_app_ui/screens/signup_screen.dart';
import 'package:event_booking_app_ui/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
