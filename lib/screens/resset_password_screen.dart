import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RessetPasswordScreen extends StatefulWidget {
  const RessetPasswordScreen({super.key});

  @override
  State<RessetPasswordScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<RessetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage('assets/backgrounds/signin_top_left.png'),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image(
              image: AssetImage('assets/backgrounds/signin_top_right.png'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image(
              image: AssetImage('assets/backgrounds/signin_center_right.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image(
              image: AssetImage('assets/backgrounds/signin_bottom_left.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage('assets/backgrounds/signin_bottom_right.png'),
            ),
          ),
          LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 54),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.arrow_back),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'Resset Password',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'Please enter your email address to ',
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'request a password reset',
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    hintText: 'abc@email.com',
                                    prefixIcon: Image(
                                      image:
                                          AssetImage('assets/icons/mail.png'),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 34),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 66),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: MyTheme.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'SEND',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyTheme.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Image(
                                    image: AssetImage(
                                        'assets/icons/right_arrow.png')),
                                SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
