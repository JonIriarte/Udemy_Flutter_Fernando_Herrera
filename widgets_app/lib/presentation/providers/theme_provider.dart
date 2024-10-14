import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

part 'theme_provider.g.dart';

@riverpod
class IsDarkMode extends _$IsDarkMode {
  @override
  bool build() {
    return false; // Initial dark mode value is false (light mode)
  }

  void toggle() {
    state = !state;
  }
}

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copywith(isDarkMode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copywith(selectedColor: colorIndex);
  }
}
