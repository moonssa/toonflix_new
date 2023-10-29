import 'package:flutter/material.dart';
import 'package:toonflix_new/screens/home_screen.dart';
import 'package:toonflix_new/services/api_services.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
