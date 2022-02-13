import 'dart:convert';

import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  String get mode {
    return _counter % 2 == 0 ? "Genap" : "Ganjil";
  }

  void increment() {
    _counter++;
    notifyListeners();
  }
}
