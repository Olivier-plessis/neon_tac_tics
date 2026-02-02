import 'package:neon_tactics/src/domain/enum/game_enum.dart';

/// Core game logic engine for Tic-Tac-Toe.
/// Provides utility methods for win detection, board manipulation, and validation.
class GameEngine {
  /// Possible winning patterns (rows, columns, diagonals).
  static const List<List<int>> victoryPatterns = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6],           // Diagonals
  ];

  /// Checks if there is a winner on the [board].
  /// Returns the winning [Player] if found, otherwise null.
  Player? checkWinner(List<Player?> board) {
    for (final pattern in victoryPatterns) {
      final [a, b, c] = pattern;
      if (board[a] != null && board[a] == board[b] && board[a] == board[c]) {
        return board[a];
      }
    }
    return null;
  }

  /// Identifies and returns the first winning pattern found on the [board].
  /// Useful for highlighting the winning line in the UI.
  List<int>? getWinningLine(List<Player?> board) {
    for (final pattern in victoryPatterns) {
      final [a, b, c] = pattern;
      if (board[a] != null && board[a] == board[b] && board[a] == board[c]) {
        return pattern;
      }
    }
    return null;
  }

  /// Determines if the [board] is full, indicating a draw if no winner exists.
  bool isBoardFull(List<Player?> board) {
    return !board.contains(null);
  }

  /// Returns indices of all empty cells on the [board].
  List<int> getEmptyindices(List<Player?> board) {
    return [
      for (var i = 0; i < board.length; i++)
        if (board[i] == null) i,
    ];
  }

  /// Simulates placing a [player]'s mark at a specific [index] on the [board].
  /// Returns a new board state without modifying the original.
  List<Player?> simulateMove(List<Player?> board, int index, Player player) {
    final newBoard = List<Player?>.from(board);
    newBoard[index] = player;
    return newBoard;
  }
}
