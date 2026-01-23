import 'package:flutter/material.dart';

const bgColor = Color(0xFF0E0E10);
const cardColor = Color(0xFF141416);
const accent = Color(0xFFD71868);
const textSecondary = Color(0xFFB3B3B3);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: bgColor,
  fontFamily: 'Inter',
  colorScheme: const ColorScheme.dark(
    primary: accent,
    background: bgColor,
  ),
);
