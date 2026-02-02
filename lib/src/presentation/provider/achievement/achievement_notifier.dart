import 'package:neon_tactics/src/core/provider/logger_provider.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'achievement_notifier.g.dart';

/// Représente un achievement déverrouillé
class UnlockedAchievement {
  final AchievementType type;
  final DateTime unlockedAt;

  UnlockedAchievement({required this.type, required this.unlockedAt});

  @override
  String toString() => 'Unlocked: ${type.title}';
}

@riverpod
class AchievementNotifier extends _$AchievementNotifier {
  @override
  UnlockedAchievement? build() {
    return null;
  }

  /// Déverrouille un achievement et le notifie
  void unlockAchievement(AchievementType type) {
    state = UnlockedAchievement(type: type, unlockedAt: DateTime.now());
    ref.read(loggerProvider).d('🎖️ Notification de succès: ${type.title}');
  }

  /// Réinitialise après l'affichage du popup
  void reset() {
    state = null;
  }
}
