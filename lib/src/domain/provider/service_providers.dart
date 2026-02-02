import 'package:neon_tactics/src/domain/services/achievement_service.dart';
import 'package:neon_tactics/src/domain/services/game_engine.dart';
import 'package:neon_tactics/src/domain/services/minimax_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_providers.g.dart';

@riverpod
GameEngine gameEngine(Ref ref) {
  return GameEngine();
}

@riverpod
MinimaxAI minimaxAI(Ref ref) {
  final engine = ref.watch(gameEngineProvider);
  return MinimaxAI(engine);
}

@riverpod
AchievementService achievementService(Ref ref) {
  return AchievementService();
}
