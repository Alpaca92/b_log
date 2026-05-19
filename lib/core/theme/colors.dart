import 'package:flutter/material.dart';

const Color kKeyYellow = Color(0xFFFFC107);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: kKeyYellow,
  onPrimary: Colors.black,
  secondary: Color(0xFFFFF59D),
  onSecondary: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
  onError: Colors.white,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: kKeyYellow,
  onPrimary: Colors.black,
  secondary: Color(0xFFFFF59D),
  onSecondary: Colors.black,
  surface: Color(0xFF2C2B28),
  onSurface: Colors.white,
  error: Color(0xFFEF5350),
  onError: Colors.black,
);
