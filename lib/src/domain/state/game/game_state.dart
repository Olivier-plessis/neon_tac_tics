import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/game_result.dart';

part 'game_state.freezed.dart';

@freezed
sealed class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = Initial;

  const factory GameState.playing({
    required List<Player?> board,
    required Player currentPlayer,
    required GameMode gameMode,
  }) = Playing;

  const factory GameState.aiThinking({required List<Player?> board, required GameMode gameMode}) =
      AiThinking;

  const factory GameState.finished({
    required List<Player?> board,
    required GameResult result,
    required GameMode gameMode,
    List<int>? winningLine,
  }) = Finished;

  const factory GameState.error(String message) = Error;

  bool get isPlaying => this is Playing;
  bool get isAiThinking => this is AiThinking;
  bool get isFinished => this is Finished;

  List<Player?>? get board => switch (this) {
    Playing(board: final b) => b,
    AiThinking(board: final b) => b,
    Finished(board: final b) => b,
    _ => null,
  };

  Player? get currentPlayer => switch (this) {
    Playing(currentPlayer: final p) => p,
    _ => null,
  };

  GameMode? get gameMode => switch (this) {
    Playing(gameMode: final m) => m,
    AiThinking(gameMode: final m) => m,
    Finished(gameMode: final m) => m,
    _ => null,
  };

  List<int>? get winningLine => switch (this) {
    Finished(winningLine: final line) => line,
    _ => null,
  };

  int get movesCount => board?.where((p) => p != null).length ?? 0;
}
