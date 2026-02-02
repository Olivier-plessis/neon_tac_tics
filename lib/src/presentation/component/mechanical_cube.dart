import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

class MechanicalCube extends HookWidget {
  final Player? player;
  final bool isWinning;
  final VoidCallback onTap;
  final bool isPlayerTurn;

  const MechanicalCube({
    super.key,
    required this.player,
    required this.isWinning,
    required this.onTap,
    this.isPlayerTurn = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final neon = context.neonColors;

    // Animation pour le "press"
    final pressController = useAnimationController(duration: const Duration(milliseconds: 100));
    final scaleAnimation = useAnimation(
      Tween<double>(
        begin: 1.0,
        end: 0.95,
      ).animate(CurvedAnimation(parent: pressController, curve: Curves.easeOut)),
    );

    // Animation de respiration unifiée
    final pulseController = useAnimationController(duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);

    final pulseValue = useAnimation(
      Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: pulseController, curve: Curves.easeInOutSine)),
    );

    final isPressed = useState(false);

    // Calcul des couleurs
    final baseBgColor = colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
    final activePulseColor = neon.accent.withValues(alpha: 0.04 + (pulseValue * 0.12));

    final Color winColor = player == Player.x ? neon.success : neon.error;
    final Color normalPlayerColor = player == Player.x ? neon.playerX : neon.playerO;
    final Color activeColor = isWinning ? winColor : normalPlayerColor;

    return GestureDetector(
      onTapDown: (_) {
        if (player == null && isPlayerTurn) {
          isPressed.value = true;
          pressController.forward();
        }
      },
      onTapUp: (_) {
        if (player == null && isPlayerTurn) {
          isPressed.value = false;
          pressController.reverse();
          onTap();
        }
      },
      onTapCancel: () {
        isPressed.value = false;
        pressController.reverse();
      },
      child: Transform.scale(
        scale: scaleAnimation,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: player == null && isPlayerTurn ? activePulseColor : baseBgColor,
            borderRadius: .circular(16.r),
            border: Border.all(
              color: isWinning
                  ? activeColor.withValues(alpha: 0.8)
                  : (player == null && isPlayerTurn)
                  ? neon.accent.withValues(alpha: 0.2 + (pulseValue * 0.2))
                  : isPressed.value
                  ? neon.accent.withValues(alpha: 0.5)
                  : colorScheme.outline.withValues(alpha: 0.1),
              width: isWinning ? 2.5 : 1.5,
            ),
            boxShadow: isWinning
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.4),
                      blurRadius: 12 + (pulseValue * 12),
                    ),
                  ]
                : (player == null && isPlayerTurn)
                ? [
                    BoxShadow(
                      color: neon.accent.withValues(alpha: 0.05 + (pulseValue * 0.05)),
                      blurRadius: 8 + (pulseValue * 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: player != null
                ? TweenAnimationBuilder<double>(
                    key: ValueKey(player),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInBack,
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: _buildPlayerIcon(player!, isWinning, neon, pulseValue),
                      );
                    },
                  )
                : _buildEmptyState(neon, isPlayerTurn, isPressed.value),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerIcon(Player player, bool isWinning, NeonColors neon, double pulseValue) {
    final color = isWinning
        ? (player == Player.x ? neon.success : neon.error)
        : (player == Player.x ? neon.playerX : neon.playerO);

    return player == Player.x
        ? CustomPaint(
            size: Size(36.w, 36.w),
            painter: _XPainter(
              color: color,
              isWinning: isWinning,
              glowFactor: isWinning ? pulseValue : 0,
            ),
          )
        : CustomPaint(
            size: Size(36.w, 36.w),
            painter: _OPainter(
              color: color,
              isWinning: isWinning,
              glowFactor: isWinning ? pulseValue : 0,
            ),
          );
  }

  Widget _buildEmptyState(NeonColors neon, bool isPlayerTurn, bool isPressed) {
    if (!isPlayerTurn) return const SizedBox.shrink();

    return Icon(
      Icons.add_rounded,
      size: 20.sp,
      color: isPressed ? neon.accent.withValues(alpha: 0.6) : neon.accent.withValues(alpha: 0.2),
    );
  }
}

class _XPainter extends CustomPainter {
  final Color color;
  final bool isWinning;
  final double glowFactor;

  _XPainter({required this.color, this.isWinning = false, this.glowFactor = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = isWinning ? 4.0 : 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (isWinning) {
      paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 1 + (glowFactor * 2));
    }

    final padding = size.width * 0.28;

    canvas.drawLine(
      Offset(padding, padding),
      Offset(size.width - padding, size.height - padding),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - padding, padding),
      Offset(padding, size.height - padding),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _XPainter oldDelegate) =>
      oldDelegate.glowFactor != glowFactor || oldDelegate.color != color;
}

class _OPainter extends CustomPainter {
  final Color color;
  final bool isWinning;
  final double glowFactor;

  _OPainter({required this.color, this.isWinning = false, this.glowFactor = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = isWinning ? 4.0 : 3.0
      ..style = PaintingStyle.stroke;

    if (isWinning) {
      paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 1 + (glowFactor * 2));
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _OPainter oldDelegate) =>
      oldDelegate.glowFactor != glowFactor || oldDelegate.color != color;
}
