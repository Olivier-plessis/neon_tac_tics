import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';

class AchievementService {
  /// Check if any achievements should be unlocked for the given profile.
  /// Returns a list of newly unlocked achievement types.
  List<AchievementType> checkNewAchievements(UserProfile profile) {
    final newAchievements = <AchievementType>[];

    // first Victory
    if (profile.wins == 1 && !_isUnlocked(profile, AchievementType.firstVictory)) {
      newAchievements.add(AchievementType.firstVictory);
    }

    // 10 victories
    if (profile.wins == 10 && !_isUnlocked(profile, AchievementType.tenVictories)) {
      newAchievements.add(AchievementType.tenVictories);
    }

    // Win streak
    if (profile.winStreak >= 5 && !_isUnlocked(profile, AchievementType.undefeated)) {
      newAchievements.add(AchievementType.undefeated);
    }

    // Note: Special conditions like perfectGame or speedRunner
    // could be added here if the UserProfile tracks those stats.

    return newAchievements;
  }

  bool _isUnlocked(UserProfile profile, AchievementType type) {
    return profile.achievements.any((a) => a.type == type && a.unlocked);
  }
}
