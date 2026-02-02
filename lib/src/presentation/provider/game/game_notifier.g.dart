// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Difficulty)
const difficultyProvider = DifficultyProvider._();

final class DifficultyProvider
    extends $NotifierProvider<Difficulty, AIDifficulty> {
  const DifficultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'difficultyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$difficultyHash();

  @$internal
  @override
  Difficulty create() => Difficulty();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AIDifficulty value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AIDifficulty>(value),
    );
  }
}

String _$difficultyHash() => r'3348fe1d861db9d22be7f6fd2b62032b8fb655a5';

abstract class _$Difficulty extends $Notifier<AIDifficulty> {
  AIDifficulty build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AIDifficulty, AIDifficulty>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AIDifficulty, AIDifficulty>,
              AIDifficulty,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(GameNotifier)
const gameProvider = GameNotifierProvider._();

final class GameNotifierProvider
    extends $NotifierProvider<GameNotifier, GameState> {
  const GameNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameNotifierHash();

  @$internal
  @override
  GameNotifier create() => GameNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameState>(value),
    );
  }
}

String _$gameNotifierHash() => r'2a2e6a028c9f6d20e0a7d91bd39b1f8a92e08e4d';

abstract class _$GameNotifier extends $Notifier<GameState> {
  GameState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GameState, GameState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameState, GameState>,
              GameState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
