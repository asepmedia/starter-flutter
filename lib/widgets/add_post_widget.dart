import 'package:flutter/material.dart';
import 'package:todoapp/utils/screen_helper.dart';

class AddPostWidget extends StatefulWidget {
  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("sds");
    super.didChangeDependencies();
  }

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
            "Create a Post",
            style: TextStyle(
                fontSize: ScreenHelper.fontSize(24, scale),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Make something interest in You!",
            style: TextStyle(
                fontSize: ScreenHelper.fontSize(17, scale),
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
