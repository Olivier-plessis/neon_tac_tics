import 'package:flutter_test/flutter_test.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/services/game_engine.dart';

void main() {
  late GameEngine gameEngine;

  setUp(() {
    gameEngine = GameEngine();
  });

  group('GameEngine Tests', () {
    test('should identify a horizontal win for Player X', () {
      final board = [
        Player.x, Player.x, Player.x,
        Player.o, null,    Player.o,
        null,     null,    null,
      ];

      expect(gameEngine.checkWinner(board), Player.x);
      expect(gameEngine.getWinningLine(board), [0, 1, 2]);
    });

    test('should identify a diagonal win for Player O', () {
      final board = [
        Player.o, Player.x, null,
        Player.x, Player.o, null,
        null,     null,    Player.o,
      ];

      expect(gameEngine.checkWinner(board), Player.o);
      expect(gameEngine.getWinningLine(board), [0, 4, 8]);
    });

    test('should identify a full board draw', () {
      final board = [
        Player.x, Player.o, Player.x,
        Player.x, Player.o, Player.o,
        Player.o, Player.x, Player.x,
      ];

      expect(gameEngine.checkWinner(board), isNull);
      expect(gameEngine.isBoardFull(board), isTrue);
    });

    test('should return empty indices correctly', () {
      final board = [
        Player.x, null,     Player.x,
        null,     Player.o, null,
        null,     null,     null,
      ];

      expect(gameEngine.getEmptyindices(board), [1, 3, 5, 6, 7, 8]);
    });

    test('should simulate a move correctly', () {
      final board = List<Player?>.filled(9, null);
      final newBoard = gameEngine.simulateMove(board, 4, Player.x);

      expect(newBoard[4], Player.x);
      expect(board[4], isNull); // Original board should not be mutated
    });
  });
}
