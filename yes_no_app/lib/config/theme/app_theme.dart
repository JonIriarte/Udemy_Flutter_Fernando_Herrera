import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.greenAccent,
  Colors.black
];
const Color _customColor = Color(0xFFd511d4);

class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Invalid color index, colour must be between 0 and ${_colorThemes.length-1}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
