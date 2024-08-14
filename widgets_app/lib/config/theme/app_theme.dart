import 'package:flutter/material.dart';

const colorlist = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.redAccent,
  Colors.deepPurple,
  Colors.purple,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected colour must be greater than 0'),
        assert(selectedColor < colorlist.length,
            'Selected colour must be less than ${colorlist.length}');

  ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorlist[selectedColor],
        appBarTheme: AppBarTheme(
            backgroundColor: colorlist[selectedColor], centerTitle: true),
      );
}
