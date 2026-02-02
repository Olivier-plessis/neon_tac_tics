// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AchievementNotifier)
const achievementProvider = AchievementNotifierProvider._();

final class AchievementNotifierProvider
    extends $NotifierProvider<AchievementNotifier, UnlockedAchievement?> {
  const AchievementNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementNotifierHash();

  @$internal
  @override
  AchievementNotifier create() => AchievementNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnlockedAchievement? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnlockedAchievement?>(value),
    );
  }
}

String _$achievementNotifierHash() =>
    r'563c20825c93ae8c662b2ab9495762b714400c51';

abstract class _$AchievementNotifier extends $Notifier<UnlockedAchievement?> {
  UnlockedAchievement? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UnlockedAchievement?, UnlockedAchievement?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnlockedAchievement?, UnlockedAchievement?>,
              UnlockedAchievement?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
