import 'package:neon_tactics/src/core/provider/logger_provider.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/game_result.dart';
import 'package:neon_tactics/src/domain/provider/service_providers.dart';
import 'package:neon_tactics/src/domain/state/game/game_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_notifier.g.dart';

@Riverpod(keepAlive: true)
class Difficulty extends _$Difficulty {
  @override
  AIDifficulty build() {
    return AIDifficulty.medium;
  }

  void update(AIDifficulty difficulty) {
    state = difficulty;
  }
}

@riverpod
class GameNotifier extends _$GameNotifier {
  String _currentGameId = '';
  bool _isResetting = false;

  @override
  GameState build() {
    final initialBoard = List<Player?>.filled(9, null);
    _currentGameId = DateTime.now().millisecondsSinceEpoch.toString();

    return GameState.playing(board: initialBoard, currentPlayer: Player.x, gameMode: GameMode.solo);
  }

  void startNewGame({required GameMode mode, required Player starter}) {
    final logger = ref.read(loggerProvider);
    if (_isResetting) {
      logger.w('⏳ Reset en cours, attendre...');
      return;
    }

    _isResetting = true;
    _currentGameId = DateTime.now().millisecondsSinceEpoch.toString();

    final initialBoard = List<Player?>.filled(9, null);

    state = GameState.playing(board: initialBoard, currentPlayer: starter, gameMode: mode);

    logger.i('🎮 Nouvelle partie: Mode=$mode, Starter=$starter');

    if (mode == GameMode.solo && starter == Player.o) {
      _triggerAiMove(_currentGameId);
    }

    _isResetting = false;
  }

  Future<void> playMove(int index) async {
    final logger = ref.read(loggerProvider);
    final engine = ref.read(gameEngineProvider);

    if (!state.isPlaying || state.isAiThinking || _isResetting) {
      logger.w('❌ Impossible de jouer maintenant');
      return;
    }

    final board = state.board;
    if (board == null || board[index] != null) {
      logger.w('❌ Coup invalide sur index $index');
      return;
    }

    logger.d('✅ Joueur ${state.currentPlayer} joue à $index');

    final newBoard = engine.simulateMove(board, index, state.currentPlayer!);

    // Vérifie si c'est terminal
    final winner = engine.checkWinner(newBoard);
    if (winner != null) {
      final winningLine = engine.getWinningLine(newBoard);
      final result = winner == Player.x
          ? GameResult.playerWon(winner: winner, winningLine: winningLine)
          : GameResult.aiWon(winner: winner, winningLine: winningLine);

      state = GameState.finished(
        board: newBoard,
        result: result,
        gameMode: state.gameMode!,
        winningLine: winningLine,
      );
      logger.i('🎮 ${winner == Player.x ? "JOUEUR" : "IA"} a gagné !');
      return;
    }

    if (engine.isBoardFull(newBoard)) {
      state = GameState.finished(
        board: newBoard,
        result: const GameResult.draw(),
        gameMode: state.gameMode!,
      );
      logger.i('🤝 Match nul');
      return;
    }

    final nextPlayer = state.currentPlayer == Player.x ? Player.o : Player.x;
    state = GameState.playing(
      board: newBoard,
      currentPlayer: nextPlayer,
      gameMode: state.gameMode!,
    );

    if (state.gameMode == GameMode.solo && nextPlayer == Player.o) {
      await _triggerAiMove(_currentGameId);
    }
  }

  Future<void> _triggerAiMove(String gameId) async {
    final logger = ref.read(loggerProvider);
    final engine = ref.read(gameEngineProvider);
    final ai = ref.read(minimaxAIProvider);

    if (!state.isPlaying) return;

    final board = state.board;
    if (board == null) return;

    state = GameState.aiThinking(board: board, gameMode: state.gameMode!);
    logger.d('🤖 IA réfléchit...');

    await Future.delayed(const Duration(milliseconds: 600));

    if (gameId != _currentGameId || _isResetting || !state.isAiThinking) {
      logger.w('⚠️ Partie réinitialisée ou état invalide');
      return;
    }

    // Crée un état temporaire pour le calcul de l'IA
    final tempState = GameState.playing(
      board: board,
      currentPlayer: Player.o,
      gameMode: state.gameMode!,
    );

    final difficulty = ref.read(difficultyProvider);
    final bestMove = ai.getBestMove(tempState, difficulty: difficulty);

    if (bestMove == -1) {
      logger.e('❌ Pas de coup disponible pour l\'IA');
      return;
    }

    logger.i('🤖 IA joue à $bestMove (Difficulté: $difficulty)');

    final newBoard = engine.simulateMove(board, bestMove, Player.o);

    final winner = engine.checkWinner(newBoard);
    if (winner != null) {
      final winningLine = engine.getWinningLine(newBoard);
      final result = GameResult.aiWon(winner: winner, winningLine: winningLine);
      state = GameState.finished(
        board: newBoard,
        result: result,
        gameMode: state.gameMode!,
        winningLine: winningLine,
      );
      logger.i('🎮 IA a gagné !');
      return;
    }

    if (engine.isBoardFull(newBoard)) {
      state = GameState.finished(
        board: newBoard,
        result: const GameResult.draw(),
        gameMode: state.gameMode!,
      );
      logger.i('🤝 Match nul');
      return;
    }

    state = GameState.playing(board: newBoard, currentPlayer: Player.x, gameMode: state.gameMode!);
  }

  void reset() {
    if (_isResetting) return;
    ref.read(loggerProvider).i('🔄 Manuel Reset');
    startNewGame(mode: state.gameMode ?? GameMode.solo, starter: Player.x);
  }
}
