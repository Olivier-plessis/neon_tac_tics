import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neon_tactics/src/core/constant/constant_key.dart';
import 'package:neon_tactics/src/core/extension/extension.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/core/theme/typography/typography.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/state/home/home_state.dart';
import 'package:neon_tactics/src/presentation/provider/game/game_notifier.dart';
import 'package:neon_tactics/src/presentation/provider/home/home_notifier.dart';
import 'package:neon_tactics/src/presentation/provider/player/player_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    final nameController = useTextEditingController();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final neon = context.neonColors;

    final titleController = useAnimationController(duration: const Duration(seconds: 3))
      ..repeat(reverse: true);

    final titleGlow = useAnimation(
      Tween<double>(
        begin: 0.4,
        end: 1.0,
      ).animate(CurvedAnimation(parent: titleController, curve: Curves.easeInOutSine)),
    );

    void handleLogin() {
      final name = nameController.text.trim();
      if (name.isNotEmpty) {
        homeNotifier.handleLogin(name);
      }
    }

    void handleDifficultySelected(AIDifficulty difficulty) {
      homeNotifier.selectDifficulty(difficulty);

      Future<void>.delayed(const Duration(milliseconds: 500), () {
        ref.read(difficultyProvider.notifier).update(difficulty);
        ref.read(playerProvider.notifier).initialize(nameController.text);
      });
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          // Arrière-plan dégradé
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.surface,
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),

          // Grille tactique en arrière-plan
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(painter: _BackgroundGridPainter(color: colorScheme.primary)),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gapH64,
                        // Logo avec halo pulsant
                        Container(
                          padding: .all(16.w),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1 * titleGlow),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withValues(alpha: 0.05 * titleGlow),
                                blurRadius: 20 * titleGlow,
                                spreadRadius: 5 * titleGlow,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.auto_awesome_mosaic_rounded,
                            color: colorScheme.primary,
                            size: 48.sp,
                          ),
                        ),

                        gapH24,

                        Text(
                          'PLAYER AUTHORIZATION',
                          style: StyleTheme.titleMedium.copyWith(
                            letterSpacing: 4 * titleGlow,
                            shadows: [
                              Shadow(
                                color: colorScheme.primary.withValues(alpha: 0.5 * titleGlow),
                                blurRadius: 10 * titleGlow,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          width: 40.w * titleGlow,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(2.r),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withValues(alpha: 0.3),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),

                        gapH48,

                        Container(
                          width: double.infinity,
                          padding: .all(24.w),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                            borderRadius: .circular(30.r),
                            border: .all(
                              color: colorScheme.onSurface.withValues(alpha: 0.1),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: PastelPalette.text.withValues(alpha: 0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 40.h,
                            children: [
                              SizedBox(
                                height: 120.h,
                                child: ListView.builder(
                                  itemCount: homeState.logs.length,
                                  itemBuilder: (context, index) => Text(
                                    homeState.logs[index],
                                    textAlign: TextAlign.center,
                                    style: StyleTheme.bodyMedium,
                                  ).paddedV(8.h),
                                ),
                              ),

                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: _buildInteractionArea(
                                  context,
                                  homeState,
                                  nameController,
                                  handleLogin,
                                  handleDifficultySelected,
                                  colorScheme,
                                  neon,
                                ),
                              ),
                            ],
                          ),
                        ),

                        gapH48,
                        Text(
                          'TACTICAL SYSTEM v1.0',
                          style: StyleTheme.bodyMedium.copyWith(
                            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                          ),
                        ),
                        gapH24,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionArea(
    BuildContext context,
    HomeState state,
    TextEditingController controller,
    VoidCallback onLogin,
    Function(AIDifficulty) onDifficulty,
    ColorScheme colorScheme,
    NeonColors neon,
  ) {
    if (state.showInput && !state.showDifficulty && !state.accessGranted) {
      return Column(
        key: const ValueKey(ConstantKey.playerNameKey),
        children: [
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: StyleTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Votre pseudo',
              filled: true,
              fillColor: colorScheme.surface.withValues(alpha: 0.5),
              hintStyle: StyleTheme.bodyMedium,
              border: OutlineInputBorder(
                borderRadius: .circular(15.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: .symmetric(vertical: 16.h),
            ),
            onSubmitted: (_) => onLogin(),
          ),
          gapH16,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: .symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(borderRadius: .circular(15.r)),
                elevation: 0,
              ),
              child: Text(
                'CONTINUER',
                style: StyleTheme.bodyLarge.copyWith(
                  letterSpacing: 2,
                  fontWeight: FontWeightTheme.black,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (state.showDifficulty && !state.accessGranted) {
      return Column(
        key: ValueKey(ConstantKey.difficultyKey),
        children: [
          Text('Choisir votre niveau de jeu', style: StyleTheme.bodyLarge),
          gapH16,
          Row(
            children: [
              _buildDiffBtn(state, AIDifficulty.easy, onDifficulty, context),
              gapW8,
              _buildDiffBtn(state, AIDifficulty.medium, onDifficulty, context),
              gapW8,
              _buildDiffBtn(state, AIDifficulty.hard, onDifficulty, context),
            ],
          ),
        ],
      );
    }

    if (state.accessGranted) {
      return Column(
        key: const ValueKey(ConstantKey.accessKey),
        children: [
          Icon(Icons.check_circle_rounded, color: neon.success, size: 48),
          SizedBox(height: 12.h),
          Text(
            'ACCESS GRANTED',
            style: TextStyle(color: neon.success, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildDiffBtn(
    HomeState state,
    AIDifficulty diff,
    Function(AIDifficulty) onDifficulty,
    BuildContext context,
  ) {
    final color = diff.color(context);
    final label = diff.label;
    final isSel = state.selectedDifficulty == diff;
    return Expanded(
      child: GestureDetector(
        onTap: () => onDifficulty(diff),
        child: Container(
          padding: .symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSel ? color : color.withValues(alpha: 0.1),
            borderRadius: .circular(12.r),
            border: .all(color: color.withValues(alpha: 0.3)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: StyleTheme.bodyMedium.copyWith(color: isSel ? PastelPalette.text : color),
          ),
        ),
      ),
    );
  }
}

class _BackgroundGridPainter extends CustomPainter {
  final Color color;
  _BackgroundGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 0.5;

    final double spacing = 40.w;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
