import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';

class AchievementPopup extends HookWidget {
  final AchievementType achievementType;
  final VoidCallback onDismiss;

  const AchievementPopup({super.key, required this.achievementType, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neon = context.neonColors;

    final controller = useAnimationController(duration: const Duration(milliseconds: 600));

    final slideAnimation = useAnimation(
      Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
    );

    final fadeAnimation = useAnimation(
      Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(
        begin: 0.8,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
    );

    useEffect(() {
      controller.forward();

      final timer = Timer(const Duration(seconds: 4), () {
        controller.reverse().then((_) => onDismiss());
      });

      return timer.cancel;
    }, [controller]);

    void handleDismiss() {
      controller.reverse().then((_) => onDismiss());
    }

    return SlideTransition(
      position: AlwaysStoppedAnimation(slideAnimation),
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation(fadeAnimation),
        child: ScaleTransition(
          scale: AlwaysStoppedAnimation(scaleAnimation),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: .circular(20.r),
                  border: .all(color: neon.accent.withValues(alpha: 0.3), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: .all(16.w),
                child: Row(
                  children: [
                    _buildAnimatedIcon(neon),
                    gapW16,
                    Expanded(
                      child: Column(
                        mainAxisSize: .min,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'UN NOUVEAU SUCCÈS !',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: neon.accent,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          gapH4,
                          Text(
                            achievementType.title,
                            style: TextStyle(
                              color: theme.textTheme.titleMedium?.color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          gapH4,
                          Text(
                            achievementType.description,
                            style: TextStyle(
                              color: theme.textTheme.bodySmall?.color,
                              fontSize: 10.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    gapW12,
                    GestureDetector(
                      onTap: handleDismiss,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        padding: .all(8.w),
                        child: Icon(
                          Icons.close,
                          color: theme.textTheme.bodySmall?.color,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(NeonColors neon) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(color: neon.warning.withValues(alpha: 0.1), shape: BoxShape.circle),
      child: Center(
        child: Icon(Icons.emoji_events_rounded, color: neon.warning, size: 32.sp),
      ),
    );
  }
}
