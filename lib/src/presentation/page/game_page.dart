import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neon_tactics/src/core/theme/constant/constants.dart';
import 'package:neon_tactics/src/core/theme/neon_theme_extension.dart';
import 'package:neon_tactics/src/core/theme/provider/theme_mode_provider.dart';
import 'package:neon_tactics/src/core/theme/typography/typography.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/model/game_result.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';
import 'package:neon_tactics/src/domain/state/game/game_state.dart';
import 'package:neon_tactics/src/presentation/component/achievement_popup.dart';
import 'package:neon_tactics/src/presentation/component/custom_app_bar_widget.dart';
import 'package:neon_tactics/src/presentation/component/game/game_action_button.dart';
import 'package:neon_tactics/src/presentation/component/game_board.dart';
import 'package:neon_tactics/src/presentation/component/indicator/animated_turn_indicator.dart';
import 'package:neon_tactics/src/presentation/component/stats_bottom_sheet.dart';
import 'package:neon_tactics/src/presentation/provider/achievement/achievement_notifier.dart';
import 'package:neon_tactics/src/presentation/provider/game/game_notifier.dart';
import 'package:neon_tactics/src/presentation/provider/player/player_notifier.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final playerProfile = ref.watch(playerProvider);
    final unlockedAchievement = ref.watch(achievementProvider);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (playerProfile == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: const Center(child: Text('Goodbye')),
      );
    }

    return switch (gameState) {
      Initial() => _buildLoading(colorScheme),
      Playing(:final board, :final currentPlayer) => _buildGame(
        context,
        ref,
        colorScheme,
        board,
        currentPlayer,
        playerProfile,
        unlockedAchievement,
      ),
      AiThinking(:final board) => _buildGame(
        context,
        ref,
        colorScheme,
        board,
        Player.o,
        playerProfile,
        unlockedAchievement,
      ),
      Finished(:final board, :final result, :final winningLine) => _buildGameFinished(
        context,
        ref,
        colorScheme,
        board,
        result,
        winningLine,
        playerProfile,
        unlockedAchievement,
      ),
      Error(:final message) => _buildError(colorScheme, message),
    };
  }

  Widget _buildLoading(ColorScheme colorScheme) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(child: CircularProgressIndicator(color: colorScheme.primary)),
    );
  }

  Widget _buildGame(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    List<Player?> board,
    Player currentPlayer,
    UserProfile playerProfile,
    UnlockedAchievement? unlockedAchievement,
  ) {
    final themeMode = ref.watch(themeModeProvider);
    final isPlayerTurn = currentPlayer == Player.x;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  colorScheme.surface,
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              CustomBarWidget(
                profile: playerProfile,
                themeRef: themeMode == ThemeMode.light,
                onThemeToggle: () {
                  ref.read(themeModeProvider.notifier).toggleThemeMode();
                },
                onShowStats: () => showStatsBottomSheet(context, playerProfile),
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: .symmetric(horizontal: 16.w, vertical: 24.h),
                    child: AnimatedTurnIndicator(current: currentPlayer),
                  ),
                  gapH8,
                  Padding(
                    padding: .symmetric(horizontal: 12.w),
                    child: GameBoard(
                      key: ValueKey(playerProfile.totalGames),
                      isPlayerTurn: isPlayerTurn,
                      gameState: GameState.playing(
                        board: board,
                        currentPlayer: currentPlayer,
                        gameMode: GameMode.solo,
                      ),
                      onMove: (index) async {
                        await ref.read(gameProvider.notifier).playMove(index);

                        if (!context.mounted) return;

                        final newGameState = ref.read(gameProvider);

                        if (newGameState case Finished(result: final result)) {
                          if (result.isPlayerWin) {
                            ref.read(playerProvider.notifier).recordWin();
                          } else if (result.isAiWin) {
                            ref.read(playerProvider.notifier).recordLoss();
                          } else {
                            ref.read(playerProvider.notifier).recordDraw();
                          }
                        }
                      },
                    ),
                  ),
                  gapH12,
                  _buildGameStatus(context, null, colorScheme),
                  gapH20,
                  Padding(
                    padding: .symmetric(horizontal: 16.w, vertical: 12.h),
                    child: _buildControls(context, colorScheme, ref),
                  ),
                  gapH24,
                ],
              ),
            ),
          ),
          if (unlockedAchievement != null)
            AchievementPopup(
              achievementType: unlockedAchievement.type,
              onDismiss: () {
                ref.read(achievementProvider.notifier).reset();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildGameFinished(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    List<Player?> board,
    GameResult result,
    List<int>? winningLine,
    UserProfile playerProfile,
    UnlockedAchievement? unlockedAchievement,
  ) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  colorScheme.surface,
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              CustomBarWidget(
                profile: playerProfile,
                themeRef: themeMode == ThemeMode.light,
                onThemeToggle: () {
                  ref.read(themeModeProvider.notifier).toggleThemeMode();
                },
                onShowStats: () => showStatsBottomSheet(context, playerProfile),
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: .symmetric(horizontal: 16.w, vertical: 24.h),
                    child: _buildGameStatus(context, result, colorScheme),
                  ),
                  gapH8,
                  Padding(
                    padding: .symmetric(horizontal: 12.w),
                    child: GameBoard(
                      gameState: GameState.finished(
                        board: board,
                        result: result,
                        gameMode: GameMode.solo,
                        winningLine: winningLine,
                      ),
                      onMove: (_) {}, // Désactivé
                    ),
                  ),
                  gapH20,
                  Padding(
                    padding: .symmetric(horizontal: 16.w, vertical: 12.h),
                    child: _buildControls(context, colorScheme, ref),
                  ),
                  gapH24,
                ],
              ),
            ),
          ),
          if (unlockedAchievement != null)
            AchievementPopup(
              achievementType: unlockedAchievement.type,
              onDismiss: () {
                ref.read(achievementProvider.notifier).reset();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildError(ColorScheme colorScheme, String message) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Text(
          '❌ $message',
          style: TextStyle(color: colorScheme.error, fontSize: 20.sp),
        ),
      ),
    );
  }

  Widget _buildGameStatus(BuildContext context, GameResult? result, ColorScheme colorScheme) {
    if (result == null) return const SizedBox.shrink();
    final neon = context.neonColors;

    return result.when(
      playerWon: (_, _) => Text(
        'VICTOIRE!',
        style: StyleTheme.displaySmall.copyWith(color: neon.success, letterSpacing: 2),
      ),
      aiWon: (_, _) => Text(
        'DEFAITE',
        style: StyleTheme.displaySmall.copyWith(color: neon.error, letterSpacing: 2),
      ),
      draw: () => Text(
        'NULL',
        style: StyleTheme.displaySmall.copyWith(color: neon.warning, letterSpacing: 2),
      ),
    );
  }

  Widget _buildControls(BuildContext context, ColorScheme colorScheme, WidgetRef ref) {
    final currentDifficulty = ref.watch(difficultyProvider);
    final isFinished = ref.watch(gameProvider.select((state) => state.isFinished));
    final neon = context.neonColors;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.w,
          children: [
            Expanded(
              child: GameActionButton(
                icon: Icons.refresh,
                label: 'NOUVELLE PARTIE',
                iconColor: isFinished ? neon.playerX : null,
                labelColor: isFinished ? neon.playerX : null,
                borderColor: isFinished ? neon.playerX : colorScheme.primary.withValues(alpha: 0.2),
                onTap: isFinished ? () => ref.read(gameProvider.notifier).reset() : null,
              ),
            ),
            Expanded(
              child: PopupMenuButton<AIDifficulty>(
                onSelected: (difficulty) {
                  ref.read(difficultyProvider.notifier).update(difficulty);
                  ref.read(gameProvider.notifier).reset();
                },
                color: colorScheme.surface,
                shape: RoundedRectangleBorder(borderRadius: .circular(12.r)),
                child: GameActionButton(
                  icon: Icons.speed,
                  label: currentDifficulty.label,
                  iconColor: currentDifficulty.color(context),
                  labelColor: currentDifficulty.color(context),
                  borderColor: currentDifficulty.color(context).withValues(alpha: 0.3),
                ),
                itemBuilder: (context) => AIDifficulty.values.map((difficulty) {
                  final isSelected = difficulty == currentDifficulty;
                  final color = difficulty.color(context);
                  final label = difficulty.label;

                  return PopupMenuItem<AIDifficulty>(
                    value: difficulty,
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.check_circle : Icons.circle_outlined,
                          color: color,
                          size: 20,
                        ),
                        gapW12,
                        Text(
                          label,
                          style: TextStyle(
                            color: color,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        gapH16,
        TextButton.icon(
          onPressed: () => ref.read(playerProvider.notifier).logout(),
          icon: Icon(Icons.logout, size: 14.sp),
          label: const Text('QUITTER LE JEU'),
        ),
      ],
    );
  }
}
