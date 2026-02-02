import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

part 'game_result.freezed.dart';

@freezed
sealed class GameResult with _$GameResult {
  const GameResult._();

  const factory GameResult.playerWon({required Player winner, List<int>? winningLine}) = PlayerWon;

  const factory GameResult.aiWon({required Player winner, List<int>? winningLine}) = AiWon;

  const factory GameResult.draw() = Draw;

  // ✅ Getters
  Player? get winner => switch (this) {
    PlayerWon(winner: final w) => w,
    AiWon(winner: final w) => w,
    _ => null,
  };

  bool get isPlayerWin => this is PlayerWon;
  bool get isAiWin => this is AiWon;
  bool get isDraw => this is Draw;
}
