import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  final Color _primaryColor = Color(0xFF4c9eeb);
  final Color _secondaryColor = Color(0xFF687684);

  return base.copyWith(
    primaryColor: _primaryColor,
    accentColor: _secondaryColor,
    backgroundColor: Colors.white,
    focusColor: Colors.black87,
    dividerColor: _secondaryColor,
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: _primaryColor, size: 24)),
    iconTheme: IconThemeData(
      color: Colors.deepPurple[300],
      size: 20.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _primaryColor, unselectedItemColor: _secondaryColor),
  );
}
