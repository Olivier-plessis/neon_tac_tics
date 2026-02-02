import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/extension/extension.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';
import 'package:neon_tactics/src/presentation/component/stats_panel.dart';

void showStatsBottomSheet(BuildContext context, UserProfile profile) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      return Container(
        padding: .only(top: 8.h, bottom: 24.h),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: .vertical(top: .circular(30.r)),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 5),
          ],
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                borderRadius: .circular(2.r),
              ),
            ),
            gapH20,

            Text(
              'STATISTIQUES DU JOUEUR',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            gapH12,
            Divider(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.1)),

            StatsPanel(profile: profile, isCompact: false),

            gapH16,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                  foregroundColor: colorScheme.primary,
                  elevation: 0,
                  padding: .symmetric(vertical: 12.h),
                ),
                child: const Text('FERMER'),
              ),
            ).paddedH(24.w),
          ],
        ),
      );
    },
  );
}
