import 'package:flutter/material.dart';
import 'package:weather/weather_screen.dart';
import 'package:weather/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00b4d8)),
        useMaterial3: true,
      ),
      title: 'Weather App',
      home: const Splash(),
    );
  }
}
