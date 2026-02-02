import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';

class StatsPanel extends StatelessWidget {
  final UserProfile profile;
  final bool isCompact;
  final VoidCallback? onToggleStats;
  final bool? isExpanded;
  final VoidCallback? onThemeToggle;
  final bool? isDarkMode;

  const StatsPanel({
    super.key,
    required this.profile,
    this.isCompact = false,
    this.onToggleStats,
    this.isExpanded,
    this.onThemeToggle,
    this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return _buildCompactStats(context);
    }
    return _buildDetailedStats(context);
  }

  Widget _buildCompactStats(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final neon = context.neonColors;

    return Padding(
      padding: .symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          // Avatar
          Container(
            padding: .all(2.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: .all(color: colorScheme.primary.withValues(alpha: 0.3), width: 1),
            ),
            child: CircleAvatar(
              backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
              radius: 18.r,
              child: Icon(Icons.person, color: colorScheme.primary, size: 18.sp),
            ),
          ),
          SizedBox(width: 12.w),

          // Infos
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  profile.username,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Level ${profile.level} • Rank #${profile.globalRank}',
                  style: TextStyle(fontSize: 10.sp, color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),

          if (onToggleStats != null)
            _buildSmallIconBtn(
              icon: Icons.bar_chart_rounded,
              color: colorScheme.primary,
              onTap: onToggleStats!,
            ),
          gapW8,
          if (onThemeToggle != null)
            _buildSmallIconBtn(
              icon: isDarkMode == false ? Icons.light_mode : Icons.dark_mode,
              color: neon.warning,
              onTap: onThemeToggle!,
            ),
        ],
      ),
    );
  }

  Widget _buildSmallIconBtn({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(8.w),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 16.sp),
      ),
    );
  }

  Widget _buildDetailedStats(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final neon = context.neonColors;

    return Container(
      padding: .symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Victoires',
                  profile.wins.toString(),
                  neon.playerX,
                  colorScheme,
                ),
              ),
              gapW12,
              Expanded(
                child: _buildStatItem(
                  'Défaites',
                  profile.losses.toString(),
                  neon.playerO,
                  colorScheme,
                ),
              ),
              gapW12,
              Expanded(
                child: _buildStatItem('Nuls', profile.draws.toString(), neon.warning, colorScheme),
              ),
            ],
          ),
          Padding(
            padding: .symmetric(vertical: 16.h),
            child: Divider(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.15),
              thickness: 1,
            ),
          ),
          // Deuxième ligne
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Level',
                  profile.level.toString(),
                  colorScheme.primary,
                  colorScheme,
                ),
              ),
              gapW12,
              Expanded(
                child: _buildStatItem(
                  'Streak',
                  profile.winStreak.toString(),
                  colorScheme.secondary,
                  colorScheme,
                ),
              ),
              gapW12,
              Expanded(
                child: _buildStatItem(
                  'Win Rate',
                  '${profile.winRate.toStringAsFixed(0)}%',
                  neon.success,
                  colorScheme,
                ),
              ),
            ],
          ),

          gapH16,

          // Barre XP
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'PROGRESSION',
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    '${profile.xp}/${profile.nextLevelXp} XP',
                    style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 8.sp),
                  ),
                ],
              ),
              gapH8,
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: profile.progressToNextLevel,
                  backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                  valueColor: AlwaysStoppedAnimation(colorScheme.primary.withValues(alpha: 0.6)),
                  minHeight: 6.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color, ColorScheme colorScheme) {
    return Container(
      height: 70.h,
      padding: .symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: .circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          gapH4,
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 7.sp,
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
