import 'package:neon_tactics/src/domain/provider/service_providers.dart';
import 'package:neon_tactics/src/presentation/provider/achievement/achievement_notifier.dart';
import 'package:neon_tactics/src/presentation/provider/player/player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'achievement_observer.g.dart';

@riverpod
void achievementObserver(Ref ref) {
  final service = ref.watch(achievementServiceProvider);

  // On écoute les changements du profil joueur
  ref.listen(playerProvider, (previous, next) {
    if (next == null) return;

    // On ne vérifie que si le joueur a gagné un match (évite les calculs inutiles)
    final previouslyWon = previous?.wins ?? 0;
    final nextWon = next.wins;

    if (nextWon > previouslyWon) {
      final newAchievements = service.checkNewAchievements(next);

      for (final type in newAchievements) {
        // 1. Débloque dans le profil (domaine/données)
        ref.read(playerProvider.notifier).grantAchievement(type);

        // 2. Déclenche le popup UI (présentation)
        ref.read(achievementProvider.notifier).unlockAchievement(type);
      }
    }
  });
}
