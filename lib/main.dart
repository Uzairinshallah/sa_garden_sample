import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_garden_sample/provider/provider.dart';
import 'package:sa_garden_sample/views/splash_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: listOfProvider,
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
