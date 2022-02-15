import 'package:flutter/material.dart';
import 'package:todoapp/utils/screen_helper.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scale = ScreenHelper.scale(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ScreenHelper.fontSize(10, scale)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Profile",
            style: TextStyle(
                fontSize: ScreenHelper.fontSize(24, scale),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Change your personal Information",
            style: TextStyle(
                fontSize: ScreenHelper.fontSize(17, scale),
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
