import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/achievement.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String id,
    required String username,
    @Default(0) int xp,
    @Default(1) int level,
    @Default(0) int wins,
    @Default(0) int losses,
    @Default(0) int draws,
    @Default([]) List<Achievement> achievements,
    @Default(0) int winStreak,
  }) = _UserProfile;

  /// Getters
  int get nextLevelXp => level * 100;

  double get progressToNextLevel => (xp / nextLevelXp).clamp(0.0, 1.0);

  double get winRate {
    final total = wins + losses + draws;
    return total == 0 ? 0.0 : (wins / total) * 100;
  }

  int get totalGames => wins + losses + draws;

  int get unlockedAchievementsCount => achievements.where((a) => a.unlocked).length;

  /// Calcule le rang basé sur les victoires (simulation)
  int get globalRank => (1000 - (wins * 10)).clamp(1, 999999);

  /// Ajoute de l'XP et gère la montée de niveau
  UserProfile addXp(int amount) {
    int newXp = xp + amount;
    int newLevel = level;

    while (newXp >= (newLevel * 100)) {
      newXp -= (newLevel * 100);
      newLevel++;
    }

    return copyWith(xp: newXp, level: newLevel);
  }

  /// Enregistre une victoire
  UserProfile recordWin() {
    return copyWith(
      wins: wins + 1,
      winStreak: winStreak + 1,
    ).addXp(50 + (winStreak * 10)); // Bonus pour streak
  }

  /// Enregistre une défaite
  UserProfile recordLoss() {
    return copyWith(losses: losses + 1, winStreak: 0);
  }

  /// Enregistre un match nul
  UserProfile recordDraw() {
    return copyWith(draws: draws + 1);
  }

  /// Déverrouille un achievement
  UserProfile unlockAchievement(AchievementType type) {
    final updated = achievements
        .map(
          (a) => a.type == type && !a.unlocked
              ? a.copyWith(unlocked: true, unlockedAt: DateTime.now())
              : a,
        )
        .toList();
    return copyWith(achievements: updated);
  }
}
