import 'package:event_booking_app_ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<VerificationScreen> {
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
                            'Verification',
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
                            'We’ve send you the verification',
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Text(
                            'code on +1 2620 0323 7631',
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  hintText: '__',
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  hintText: '__',
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  hintText: '__',
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  hintText: '__',
                                ),
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
                                    'CONTINUE',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Re-send code in ',
                            style: TextStyle(fontSize: 18, color: MyTheme.grey),
                          ),
                          Text(
                            ' 0:20',
                            style: TextStyle(
                                fontSize: 18, color: MyTheme.primaryColor),
                          ),
                        ],
                      ),
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
