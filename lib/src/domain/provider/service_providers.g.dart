// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameEngine)
const gameEngineProvider = GameEngineProvider._();

final class GameEngineProvider
    extends $FunctionalProvider<GameEngine, GameEngine, GameEngine>
    with $Provider<GameEngine> {
  const GameEngineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameEngineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameEngineHash();

  @$internal
  @override
  $ProviderElement<GameEngine> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameEngine create(Ref ref) {
    return gameEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameEngine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameEngine>(value),
    );
  }
}

String _$gameEngineHash() => r'982ad0977b5fef5802553ae7f1b96a3a6f97d33e';

@ProviderFor(minimaxAI)
const minimaxAIProvider = MinimaxAIProvider._();

final class MinimaxAIProvider
    extends $FunctionalProvider<MinimaxAI, MinimaxAI, MinimaxAI>
    with $Provider<MinimaxAI> {
  const MinimaxAIProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'minimaxAIProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$minimaxAIHash();

  @$internal
  @override
  $ProviderElement<MinimaxAI> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MinimaxAI create(Ref ref) {
    return minimaxAI(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MinimaxAI value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MinimaxAI>(value),
    );
  }
}

String _$minimaxAIHash() => r'029d620a919087279f5310ec7e5893ef2069f39f';

@ProviderFor(achievementService)
const achievementServiceProvider = AchievementServiceProvider._();

final class AchievementServiceProvider
    extends
        $FunctionalProvider<
          AchievementService,
          AchievementService,
          AchievementService
        >
    with $Provider<AchievementService> {
  const AchievementServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementServiceHash();

  @$internal
  @override
  $ProviderElement<AchievementService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AchievementService create(Ref ref) {
    return achievementService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AchievementService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AchievementService>(value),
    );
  }
}

String _$achievementServiceHash() =>
    r'702e29bcdfca4ac750613d2fb6b3608e85195ff3';
