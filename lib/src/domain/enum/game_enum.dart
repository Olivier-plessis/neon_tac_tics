import 'package:flutter/material.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';

/// Represents the different states of a cell or a player's turn.
enum Player {
  /// Empty cell or no specified player.
  none,

  /// Player using 'X' symbol (usually the human player).
  x,

  /// Player using 'O' symbol (usually the AI).
  o,
}

/// Represents the current game state.
enum GameStatus {
  /// Game is currently active.
  playing,

  /// Game ended in a draw.
  draw,

  /// Game ended with a victory.
  won,
}

/// Available game modes.
enum GameMode {
  /// Local Player vs Player.
  pvp,

  /// Player vs AI.
  solo,
}

/// Defines the difficulty level of the AI opponent.
/// Centralizes tactical labels and associated colors for the UI.
enum AIDifficulty {
  easy,
  medium,
  hard;

  /// Returns the tactical label corresponding to the level.
  String get label => switch (this) {
    easy => 'SIMPLE',
    medium => 'TACTIC',
    hard => 'ELITE',
  };

  /// Returns the color associated with the difficulty based on the Neon theme.
  Color color(BuildContext context) {
    final neon = context.neonColors;
    return switch (this) {
      easy => neon.success,
      medium => neon.warning,
      hard => neon.error,
    };
  }
}

/// Defines unlockable achievement types.
/// Uses a sealed class to ensure exhaustiveness in switch statements
/// while centralizing metadata (titles and descriptions).
sealed class AchievementType {
  const AchievementType();

  /// First match won.
  static const firstVictory = _FirstVictory();

  /// Total of ten victories achieved.
  static const tenVictories = _TenVictories();

  /// Quick victory with minimum moves.
  static const perfectGame = _PerfectGame();

  /// Fast victory in terms of time.
  static const speedRunner = _SpeedRunner();

  /// Winning streak without any losses.
  static const undefeated = _Undefeated();

  /// Exhaustive list of all available achievements.
  /// Used to initialize player profiles.
  static const List<AchievementType> all = [
    firstVictory,
    tenVictories,
    perfectGame,
    speedRunner,
    undefeated,
  ];

  /// Formatted title of the achievement.
  String get title => switch (this) {
    _FirstVictory() => 'PREMIER SUCCESS',
    _TenVictories() => 'COMBATANT',
    _PerfectGame() => 'JEU PARFAIT',
    _SpeedRunner() => 'ECLAIRE',
    _Undefeated() => 'INVINCIBLE',
  };

  /// Description of unlocking conditions.
  String get description => switch (this) {
    _FirstVictory() => 'Gagnez votre premier match',
    _TenVictories() => 'Gagnez 10 matches',
    _PerfectGame() => 'Gagnez en moins de 5 coups',
    _SpeedRunner() => 'Gagnez en moins de 2 secondes',
    _Undefeated() => 'Gagnez 5 matchs d\'affilée',
  };
}

/// Private implementation of 'FIRST VICTORY' achievement.
class _FirstVictory extends AchievementType {
  const _FirstVictory();
}

/// Private implementation of 'COMBATANT' achievement.
class _TenVictories extends AchievementType {
  const _TenVictories();
}

/// Private implementation of 'PERFECT GAME' achievement.
class _PerfectGame extends AchievementType {
  const _PerfectGame();
}

/// Private implementation of 'LIGHTNING' achievement.
class _SpeedRunner extends AchievementType {
  const _SpeedRunner();
}

/// Private implementation of 'INVINCIBLE' achievement.
class _Undefeated extends AchievementType {
  const _Undefeated();
}
