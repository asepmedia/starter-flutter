import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _username = "";

  String _password = "";

  bool _showPassword = false;

  String get username {
    return _username;
  }

  String get password {
    return _password;
  }

  bool get showPassword {
    return _showPassword;
  }

  bool get isEmptyPassword {
    return _password.isEmpty;
  }

  bool get isEmptyUsername {
    return _username.isEmpty;
  }

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
