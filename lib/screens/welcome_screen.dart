import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth/login_screen.dart';
import 'package:todoapp/utils/screen_helper.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scale = ScreenHelper.scale(context);
    var sizeTopbar = ScreenHelper.fontSize(120, scale);

    _getStartedHandler() {
      print("Started Clicked");
      ScreenHelper.navigateTo(context, name: (LoginScreen).toString());
    }

    return Scaffold(
      backgroundColor: Color(0xFFF0F1F5),
      body: SafeArea(
        child: Container(
          color: Color(0xFFF0F1F5),
          width: double.infinity,
          height: ScreenHelper.height(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(ScreenHelper.fontSize(40, scale)),
                child: Column(
                  children: [
                    Text("Hi, Guest!",
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(28, scale),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("Please Welcome to Future",
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(24, scale),
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 30),
                    SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Color(0xFF1A237E),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: _getStartedHandler,
                            child: Text(
                              "Get Started!",
                              style: TextStyle(
                                  fontSize: ScreenHelper.fontSize(28, scale),
                                  fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
