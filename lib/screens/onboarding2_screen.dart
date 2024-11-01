import 'package:event_booking_app_ui/screens/login_screen.dart';
import 'package:event_booking_app_ui/screens/onboarding3_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image(
                    image: AssetImage('assets/images/onboarding2_pic.png'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(132, 201, 134, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(42),
                  topRight: Radius.circular(42),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40),
                  Text(
                    '  Join the events you want ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '  Join us in making a difference! Discover a variety\n of volunteering opportunities that cater\n to different interests and skills.   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(), // Navigate to your Login screen
                          ));
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white38,
                            maxRadius: 6,
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 6,
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white38,
                            maxRadius: 6,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Onboarding3Screen(),
                          ));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
