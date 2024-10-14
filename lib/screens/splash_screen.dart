import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child:
                Image(image: AssetImage('assets/images/top_right_shade.png')),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(width: 8),
                Image(image: AssetImage('assets/images/vent_hub_label.png')),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:
                Image(image: AssetImage('assets/images/bottom_left_shade.png')),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:
                Image(image: AssetImage('assets/images/bottom_right_shade.png')),
          ),
        ],
      ),
    );
  }
}