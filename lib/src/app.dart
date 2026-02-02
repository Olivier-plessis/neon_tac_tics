import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_tactics/src/core/theme/app_theme.dart';
import 'package:neon_tactics/src/domain/model/user_profile.dart';
import 'package:neon_tactics/src/presentation/page/game_page.dart';
import 'package:neon_tactics/src/presentation/page/home_page.dart';
import 'package:neon_tactics/src/presentation/provider/achievement/achievement_observer.dart';
import 'package:neon_tactics/src/presentation/provider/player/player_notifier.dart';

import 'core/constant/constant_key.dart';
import 'core/theme/provider/theme_mode_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);
    final ThemeMode themeMode = themeModeAsync;

    ref.watch(achievementObserverProvider);

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        onGenerateTitle: (BuildContext context) => 'Neon TacTics app',
        home: const _RootNavigator(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(.9)),
            child: child!,
          );
        },
      ),
    );
  }
}

class _RootNavigator extends ConsumerWidget {
  const _RootNavigator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserProfile? player = ref.watch(playerProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: player == null
          ? const HomePage(key: ValueKey(ConstantKey.homeKey))
          : const GamePage(key: ValueKey(ConstantKey.gameKey)),
    );
  }
}
