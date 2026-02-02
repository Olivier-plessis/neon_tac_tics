import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';

/// The [AppTheme] defines light and dark themes for the app.
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light =
      FlexThemeData.light(
        scheme: FlexScheme.materialBaseline,
        swapLegacyOnMaterial3: true,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          cardRadius: 16.0,
          elevatedButtonRadius: 12.0,
          outlinedButtonRadius: 12.0,
        ),
        // Direct ThemeData properties.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const NeonColors(
            playerX: PastelPalette.playerX,
            playerO: PastelPalette.playerO,
            success: PastelPalette.success,
            warning: PastelPalette.warning,
            error: PastelPalette.error,
            cardBg: PastelPalette.cardBg,
            accent: PastelPalette.primary,
          ),
        ],
      );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark =
      FlexThemeData.dark(
        scheme: FlexScheme.materialBaseline,
        swapLegacyOnMaterial3: true,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          blendOnColors: true,
          useM2StyleDividerInM3: true,
          adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          cardRadius: 16.0,
          elevatedButtonRadius: 12.0,
          outlinedButtonRadius: 12.0,
        ),
        // Direct ThemeData properties.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const NeonColors(
            playerX: PastelPalette.playerX,
            playerO: PastelPalette.playerO,
            success: PastelPalette.success,
            warning: PastelPalette.warning,
            error: PastelPalette.error,
            cardBg: Color(0xFF0F172A),
            accent: PastelPalette.primary,
          ),
        ],
      );
}
