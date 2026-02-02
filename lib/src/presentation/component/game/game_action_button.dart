import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';

class GameActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final Color borderColor;
  final VoidCallback? onTap;

  const GameActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
    this.labelColor,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isEnabled = onTap != null;

    return Opacity(
      opacity: isEnabled ? 1.0 : 0.4,
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(12.r),
        child: Container(
          padding: .symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: .circular(12.r),
            border: .all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18.sp, color: iconColor),
              gapW8,
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, color: labelColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
