import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';
import 'package:neon_tactics/src/presentation/component/stats_panel.dart';

class CustomBarWidget extends StatelessWidget {
  final UserProfile profile;
  final bool themeRef;
  final VoidCallback onThemeToggle;
  final VoidCallback onShowStats;

  const CustomBarWidget({
    super.key,
    required this.profile,
    required this.themeRef,
    required this.onThemeToggle,
    required this.onShowStats,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 60.h + statusBarHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: .only(top: statusBarHeight + 10.h, left: 16.w, right: 16.w),
          child: _buildHeader(context),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
        borderRadius: .circular(20.r),
        border: .all(color: colorScheme.onSurface.withValues(alpha: 0.1), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: StatsPanel(
        profile: profile,
        isCompact: true,
        onToggleStats: onShowStats,
        onThemeToggle: onThemeToggle,
        isDarkMode: !themeRef,
      ),
    );
  }
}
