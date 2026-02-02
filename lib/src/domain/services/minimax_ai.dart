import 'dart:math';

import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/services/game_engine.dart';
import 'package:neon_tactics/src/domain/state/game/game_state.dart';

/// Pure AI logic providing different levels of strategic depth.
/// Uses the Minimax algorithm for optimal decision-making.
class MinimaxAI {
  final GameEngine _engine;
  final _random = Random();

  MinimaxAI(this._engine);

  /// Calculates the best move for the AI based on the selected [difficulty].
  int getBestMove(GameState state, {AIDifficulty difficulty = AIDifficulty.medium}) =>
      switch (difficulty) {
        AIDifficulty.easy => _easyMove(state),
        AIDifficulty.medium => _mediumMove(state),
        AIDifficulty.hard => _hardMove(state),
      };

  /// EASY: The AI plays a completely random move from available empty spaces.
  int _easyMove(GameState state) {
    final board = state.board;
    if (board == null) return -1;

    final emptySpaces = _engine.getEmptyindices(board);

    return emptySpaces.isEmpty ? -1 : emptySpaces[_random.nextInt(emptySpaces.length)];
  }

  /// MEDIUM: A hybrid strategy that alternates between strategic moves and random play.
  /// This creates a more "human-like" fallible opponent.
  int _mediumMove(GameState state) => state.movesCount.isEven ? _easyMove(state) : _hardMove(state);

  /// HARD: The AI uses the Minimax algorithm to find the mathematically optimal move.
  /// At this level, the AI is unbeatable and will always force a win or a draw.
  int _hardMove(GameState state) {
    final board = state.board;
    if (board == null) return -1;

    var (bestScore, bestMove) = (-1000, -1);

    for (var i = 0; i < board.length; i++) {
      if (board[i] == null) {
        // Simulate move on a transient board state
        final score = _minimax(_engine.simulateMove(board, i, Player.o), 0, false);
        if (score > bestScore) {
          (bestScore, bestMove) = (score, i);
        }
      }
    }

    return bestMove;
  }

  /// Recursive Minimax algorithm with depth-based scoring.
  ///
  /// [board] is the current board state being evaluated.
  /// [depth] represents how many turns ahead the algorithm is looking.
  /// [isMaximizing] is true when calculating for the AI's turn (seeking highest score).
  int _minimax(List<Player?> board, int depth, bool isMaximizing) {
    final winner = _engine.checkWinner(board);

    // Terminal state scoring: wins are prioritized by speed (lower depth)
    if (winner != null) {
      return switch (winner) {
        Player.o => 10 - depth,
        Player.x => depth - 10,
        Player.none => 0,
      };
    }

    if (_engine.isBoardFull(board)) return 0;

    if (isMaximizing) {
      var bestScore = -1000;
      for (var i = 0; i < board.length; i++) {
        if (board[i] == null) {
          final score = _minimax(_engine.simulateMove(board, i, Player.o), depth + 1, false);
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      var bestScore = 1000;
      for (var i = 0; i < board.length; i++) {
        if (board[i] == null) {
          final score = _minimax(_engine.simulateMove(board, i, Player.x), depth + 1, true);
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }
}
