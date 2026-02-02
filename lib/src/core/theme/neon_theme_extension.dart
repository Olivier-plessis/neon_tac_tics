import 'package:flutter/material.dart';

class NeonColors extends ThemeExtension<NeonColors> {
  final Color playerX;
  final Color playerO;
  final Color success;
  final Color warning;
  final Color error;
  final Color cardBg;
  final Color accent;

  const NeonColors({
    required this.playerX,
    required this.playerO,
    required this.success,
    required this.warning,
    required this.error,
    required this.cardBg,
    required this.accent,
  });

  @override
  ThemeExtension<NeonColors> copyWith({
    Color? playerX,
    Color? playerO,
    Color? success,
    Color? warning,
    Color? error,
    Color? cardBg,
    Color? accent,
  }) {
    return NeonColors(
      playerX: playerX ?? this.playerX,
      playerO: playerO ?? this.playerO,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      cardBg: cardBg ?? this.cardBg,
      accent: accent ?? this.accent,
    );
  }

  @override
  ThemeExtension<NeonColors> lerp(ThemeExtension<NeonColors>? other, double t) {
    if (other is! NeonColors) return this;
    return NeonColors(
      playerX: Color.lerp(playerX, other.playerX, t)!,
      playerO: Color.lerp(playerO, other.playerO, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      cardBg: Color.lerp(cardBg, other.cardBg, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}

extension NeonThemeContext on BuildContext {
  NeonColors get neonColors => Theme.of(this).extension<NeonColors>()!;
}
