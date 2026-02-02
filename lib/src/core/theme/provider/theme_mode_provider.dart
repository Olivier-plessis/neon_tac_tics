import 'package:flutter/material.dart';
import 'package:neon_tactics/src/core/theme/provider/platform_brightness_provider.dart';
import 'package:neon_tactics/src/core/utils/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const String key = 'themeMode';

  SharedPreferences get _sharedPreferences => ref.watch(sharedPreferencesProvider).requireValue;

  @override
  ThemeMode build() {
    ref.watch(platformBrightnessProvider);

    final themeModeStr = _sharedPreferences.getString(key);
    return switch (themeModeStr) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  void setThemeMode(ThemeMode mode) {
    _sharedPreferences.setString(key, mode.name);
    ref.invalidateSelf();
  }

  void toggleThemeMode() {
    final newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
      ThemeMode.system => ThemeMode.light,
    };
    setThemeMode(newMode);
  }
}
