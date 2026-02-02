import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/core/theme/typography/typography.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

class AnimatedTurnIndicator extends HookWidget {
  final Player current;
  const AnimatedTurnIndicator({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    final isX = current == Player.x;
    final neon = context.neonColors;
    final color = isX ? neon.playerX : neon.warning;

    final controller = useAnimationController(duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);

    final opacityAnimation = useAnimation(
      Tween<double>(
        begin: 0.08,
        end: 0.22,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutSine)),
    );

    return Container(
      padding: .symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: opacityAnimation),
        border: .all(color: color.withValues(alpha: 0.4), width: 1.5),
        borderRadius: .circular(20.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: opacityAnimation),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 12.w),
          Text(
            isX ? 'À VOTRE TOUR' : "L'IA RÉFLÉCHIT...",
            style: StyleTheme.bodySmall.copyWith(
              color: color,
              letterSpacing: 1.5,
              fontWeight: FontWeightTheme.extraBold,
            ),
          ),
        ],
      ),
    );
  }
}
