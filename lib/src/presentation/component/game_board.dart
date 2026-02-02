import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/extension/extension.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/domain/state/game/game_state.dart';
import 'package:neon_tactics/src/presentation/component/mechanical_cube.dart';

class GameBoard extends StatelessWidget {
  final GameState gameState;
  final Function(int) onMove;
  final bool isPlayerTurn;

  const GameBoard({
    super.key,
    required this.gameState,
    required this.onMove,
    this.isPlayerTurn = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final neon = context.neonColors;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: .all(12.w),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.08),
            border: .all(color: neon.accent.withValues(alpha: 0.2), width: 1.5),
            borderRadius: .circular(24.r),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _GridPainter(color: neon.accent.withValues(alpha: 0.03)),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: .symmetric(vertical: 8.h),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 4.w,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final player = gameState.board?[index];
                  final isWinningCell = gameState.winningLine?.contains(index) ?? false;
                  return MechanicalCube(
                    player: player,
                    isWinning: isWinningCell,
                    onTap: () => onMove(index),
                    isPlayerTurn: isPlayerTurn && player == null,
                  ).paddedAll(8);
                },
              ),
              // Overlay Scanlines (CRT feel)
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(12.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: List.generate(
                        100,
                        (index) => index % 2 == 0
                            ? Colors.transparent
                            : Colors.black.withValues(alpha: 0.01),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    final stepX = size.width / 12;
    final stepY = size.height / 12;

    for (double i = 0; i <= size.width; i += stepX) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i <= size.height; i += stepY) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
