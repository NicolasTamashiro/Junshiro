import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const GameShelfApp());
}

class GameShelfApp extends StatelessWidget {
  const GameShelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameShelf',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8C64E8),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF17121F),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
