import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/providers/counter_provider.dart';
import 'package:todoapp/providers/task_provider.dart';
import 'package:todoapp/screens/main_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';
import 'package:todoapp/services/http_service.dart';
import 'package:todoapp/services/task_service.dart';
import 'routes/route.dart' as RouteCotainer;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Bracket Function
// void main() {
//   runApp(MyApp());
// }

//Arrow function
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
      initialRoute: (WelcomeScreen).toString(),
      routes: RouteCotainer.Route.lists(),
    );
  }
}
