import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(){
    const seedColour = Colors.deepPurple; 
    return ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: seedColour, 
      listTileTheme: const ListTileThemeData(
        iconColor: seedColour

      )
    );

  }
}