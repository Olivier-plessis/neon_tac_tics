import 'package:flutter/material.dart';
import 'package:neon_tactics/src/core/theme/provider/platform_brightness_provider.dart';
import 'package:neon_tactics/src/core/theme/provider/theme_mode_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resolved_brightness_provider.g.dart';

/// Provider that returns the actual resolved brightness (Light or Dark)
/// based on the user's ThemeMode and the system's PlatformBrightness.
@riverpod
Brightness resolvedBrightness(Ref ref) {
  final themeMode = ref.watch(themeModeProvider);
  final platformBrightness = ref.watch(platformBrightnessProvider);

  return switch (themeMode) {
    ThemeMode.light => Brightness.light,
    ThemeMode.dark => Brightness.dark,
    ThemeMode.system => platformBrightness,
  };
}
