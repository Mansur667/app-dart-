import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/root_screen.dart';


void main() {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const RootScreen(),
    );
  }
}
