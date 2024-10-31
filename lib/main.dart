import 'package:event_booking_app_ui/screens/onboarding1_screen.dart';
import 'package:event_booking_app_ui/screens/login_screen.dart';
import 'package:event_booking_app_ui/screens/register_screen.dart';
import 'package:event_booking_app_ui/screens/splash_screen.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Firebase options configuration
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/', // Set the initial route to SplashScreen
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/onboarding': (context) => Onboarding1Screen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
