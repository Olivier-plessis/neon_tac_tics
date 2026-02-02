// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_observer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(achievementObserver)
const achievementObserverProvider = AchievementObserverProvider._();

final class AchievementObserverProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  const AchievementObserverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementObserverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementObserverHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return achievementObserver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$achievementObserverHash() =>
    r'fdc4b1012638df9a5bb2eb8a84f34db6862ecfb8';
