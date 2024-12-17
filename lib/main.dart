import 'package:first_flutter_project/ui/screens/home/home_screen.dart';
import 'package:first_flutter_project/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
