import 'package:flutter/material.dart';
import 'package:todoapp/models/tab_menu.dart';

class TabProvider with ChangeNotifier {
  int _activeTab = 0;

  final List<TabMenu> _tabs = [
    TabMenu(inActive: Icons.home_outlined, active: Icons.home),
    TabMenu(
        inActive: Icons.add_circle_outline_outlined, active: Icons.add_circle),
    TabMenu(inActive: Icons.explore_outlined, active: Icons.explore),
    TabMenu(inActive: Icons.person_outline_outlined, active: Icons.person)
  ];

  int get activeTab {
    return _activeTab;
  }

  List<TabMenu> get tabs {
    return _tabs;
  }

  void changeTab(int index) {
    _activeTab = index;
    notifyListeners();
  }
}
