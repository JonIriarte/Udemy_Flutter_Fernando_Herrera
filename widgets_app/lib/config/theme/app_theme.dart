import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.redAccent,
  Colors.deepPurple,
  Colors.purple,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
      : assert(selectedColor >= 0, 'Selected colour must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected colour must be less than ${colorList.length}');

  ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode? Brightness.dark: Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(
            backgroundColor: colorList[selectedColor], centerTitle: true),
      );
}
