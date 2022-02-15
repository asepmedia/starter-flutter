import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/utils/screen_helper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameInput = TextEditingController();
    final TextEditingController passwordInput = TextEditingController();

    var scale = ScreenHelper.scale(context);

    _getStartedHandler() {
      ScreenHelper.navigateTo(context, name: (HomeScreen).toString());
    }

    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFF0F1F5),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(ScreenHelper.fontSize(40, scale)),
                  color: const Color(0xFFF0F1F5),
                  height: ScreenHelper.height(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Portal Masa Depan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(28, scale),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Menuju Portal Masa Depan Yang Lebih Baik",
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(13, scale),
                            color: const Color(0xFF4B5157)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Nama Pengguna",
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(16, scale),
                            color: const Color(0xFF383232),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: usernameInput,
                        onChanged: (value) {
                          authProvider.setUsername(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.people_outlined),
                          hintText: "Nama Pengguna",
                          contentPadding: const EdgeInsets.all(20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xFF1A237E)),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Kata Sandi",
                        style: TextStyle(
                            fontSize: ScreenHelper.fontSize(16, scale),
                            color: const Color(0xFF383232),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        obscureText: !authProvider.showPassword,
                        controller: passwordInput,
                        onChanged: (value) {
                          authProvider.setPassword(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Kata Sandi",
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: GestureDetector(
                            onTap: (() {
                              authProvider.toggleShowPassword();
                            }),
                            child: Icon(authProvider.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2.0, color: Color(0xFF1A237E)),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Lupa Kata Sandi..");
                            },
                            child: Text(
                              "Lupa Kata Sandi?",
                              style: TextStyle(
                                  fontSize: ScreenHelper.fontSize(13, scale),
                                  color: const Color(0xFF4B5157)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: const Color(0xFF1A237E),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: _getStartedHandler,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: ScreenHelper.fontSize(28, scale),
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                )
              ],
            )
          ],
        ))),
      );
    });
  }
}
