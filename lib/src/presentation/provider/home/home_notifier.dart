import 'dart:async';

import 'package:logger/logger.dart';
import 'package:neon_tactics/src/core/provider/logger_provider.dart';
import 'package:neon_tactics/src/domain/enum/game_enum.dart';
import 'package:neon_tactics/src/domain/state/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  final List<String> _welcomeMessages = [
    'ÉTABLISSEMENT DE LA CONNEXION...',
    'CHARGEMENT DE L\'INTERFACE TACTIQUE...',
    'ANALYSE DU SYSTÈME RÉUSSIE.',
  ];

  @override
  HomeState build() {
    _startSequence();
    return const HomeState();
  }

  Logger get _logger => ref.read(loggerProvider);

  Future<void> _startSequence() async {
    for (var msg in _welcomeMessages) {
      await Future.delayed(const Duration(milliseconds: 800));
      state = state.copyWith(logs: [...state.logs, msg]);
    }
    state = state.copyWith(showInput: true);
  }

  void handleLogin(String name) {
    if (name.trim().isEmpty) return;

    _logger.i('👤 Login attempt by: $name');
    state = state.copyWith(
      showInput: false,
      logs: [...state.logs, 'Bienvenue, $name.'],
      showDifficulty: true,
    );
  }

  void selectDifficulty(AIDifficulty difficulty) {
    _logger.d('🎯 Difficulty selected: $difficulty');
    state = state.copyWith(
      selectedDifficulty: difficulty,
      showDifficulty: false,
      accessGranted: true,
    );
  }
}
