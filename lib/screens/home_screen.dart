import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/post.dart';
import 'package:todoapp/providers/post_provider.dart';
import 'package:todoapp/providers/tab_provider.dart';
import 'package:todoapp/screens/auth/login_screen.dart';
import 'package:todoapp/utils/screen_helper.dart';
import 'package:todoapp/widgets/add_post_widget.dart';
import 'package:todoapp/widgets/explore_widget.dart';
import 'package:todoapp/widgets/home_post_widget.dart';
import 'package:todoapp/widgets/profile_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scale = ScreenHelper.scale(context);
    var height = ScreenHelper.fontSize(ScreenHelper.height(context), scale);
    var sizeTopbar = ScreenHelper.percentOf(height, 10);
    var sizeBottombar = ScreenHelper.percentOf(height, 8);
    var sizeContainer = ScreenHelper.percentOf(height, 80);
    var fragements = [
      HomePostWidget(),
      AddPostWidget(),
      ExploreWidget(),
      ProfileWidget()
    ];

    _getStartedHandler() {
      ScreenHelper.navigateTo(context, name: (LoginScreen).toString());
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          color: Color(0xFFF0F1F5),
          width: double.infinity,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                height: sizeTopbar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "KutuBuku",
                      style: TextStyle(
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.w900,
                          fontSize: ScreenHelper.fontSize(40, scale)),
                    )
                  ],
                ),
              ),
              Consumer<TabProvider>(builder: ((context, tabProvider, child) {
                var currentTab = tabProvider.activeTab;
                return Expanded(
                    child: SizedBox(
                        height: sizeContainer, child: fragements[currentTab]));
              })),
              Consumer<TabProvider>(builder: ((context, tabProvider, child) {
                var tabs = tabProvider.tabs;
                var currentTab = tabProvider.activeTab;
                return Container(
                  color: Colors.white,
                  height: sizeBottombar,
                  padding: EdgeInsets.all(ScreenHelper.fontSize(10, scale)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < tabs.length; i++)
                        GestureDetector(
                          onTap: () {
                            tabProvider.changeTab(i);
                          },
                          child: Icon(
                            currentTab == i ? tabs[i].active : tabs[i].inActive,
                            color: currentTab == i
                                ? const Color(0xFF1A237E)
                                : Colors.black38,
                            size: ScreenHelper.fontSize(35, scale),
                          ),
                        )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
