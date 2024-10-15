import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                      Image(image: AssetImage('assets/images/logo1.png')),
                      SizedBox(height: 12),
                      Text(
                        'EventHub',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'SignIn',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Image(
                                image: AssetImage('assets/icons/mail.png')),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            hintText: 'abc@gmail.com',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Image(
                                image: AssetImage('assets/icons/locked.png')),
                            suffixIcon: Image(
                                image:
                                    AssetImage('assets/icons/eye_close.png')),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            hintText: 'Your Password',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text('Remember Me'),
                          Expanded(
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        margin: EdgeInsets.symmetric(horizontal: 66),
                        decoration: BoxDecoration(
                          color: MyTheme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'SIGN IN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: MyTheme.white, fontSize: 16),
                              ),
                            ),
                            Image(
                                image:
                                    AssetImage('assets/icons/right_arrow.png')),
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Text(
                        'OR',
                        style: TextStyle(fontSize: 18, color: MyTheme.grey),
                      ),
                      SizedBox(height: 8),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 66),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: MyTheme.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/icons/google.png')),
                            SizedBox(width: 16),
                            Text(
                              'Login with Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.symmetric(horizontal: 66),
                        decoration: BoxDecoration(
                            color: MyTheme.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/icons/facebook.png')),
                            SizedBox(width: 16),
                            Text(
                              'Login with Facebook',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Sign up",
                            style: TextStyle(
                              color: MyTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
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
