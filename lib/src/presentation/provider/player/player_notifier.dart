import 'package:logger/logger.dart';
import 'package:neon_tactics/src/core/provider/logger_provider.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/achievement.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  @override
  UserProfile? build() {
    return null;
  }

  Logger get _logger => ref.read(loggerProvider);

  void initialize(String username) {
    final allAchievements =
        AchievementType.all.map((type) => Achievement(type: type, unlocked: false)).toList();

    state = UserProfile(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      achievements: allAchievements,
    );
    _logger.i('👤 Player profile initialized: $username');
  }

  void recordWin() {
    if (state == null) return;

    state = state!.recordWin();
    _logger.i('🏆 Victory recorded! XP: ${state!.xp}/${state!.nextLevelXp}');
  }

  void recordLoss() {
    if (state == null) return;

    state = state!.recordLoss();
    _logger.i('💔 Loss recorded');
  }

  void recordDraw() {
    if (state == null) return;

    state = state!.recordDraw();
    _logger.i('🤝 Draw recorded');
  }

  /// ✅ Allows the achievement engine to update the profile in a decoupled way
  void grantAchievement(AchievementType type) {
    if (state == null) return;
    
    // Prevents duplicate unlocks (extra safety)
    if (state!.achievements.any((a) => a.type == type && a.unlocked)) return;

    state = state!.unlockAchievement(type);
    _logger.i('🏅 Achievement granted to profile: ${type.title}');
  }

  void logout() {
    _logger.i('🚪 User logged out');
    state = null;
  }
}
