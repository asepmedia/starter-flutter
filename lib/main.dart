import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/counter_provider.dart';
import 'package:todoapp/providers/task_provider.dart';
import 'package:todoapp/screens/main_screen.dart';
import 'routes/route.dart' as RouteCotainer;

// Bracket Function
// void main() {
//   runApp(MyApp());
// }

//Arrow function
void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: AuthLoginScreen(),
      initialRoute: (MainScreen).toString(),
      routes: RouteCotainer.Route.lists(),
    );
  }
}
