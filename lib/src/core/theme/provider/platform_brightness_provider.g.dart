// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_brightness_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that listens to platform brightness changes using WidgetsBindingObserver

@ProviderFor(PlatformBrightness)
const platformBrightnessProvider = PlatformBrightnessProvider._();

/// Provider that listens to platform brightness changes using WidgetsBindingObserver
final class PlatformBrightnessProvider
    extends $NotifierProvider<PlatformBrightness, Brightness> {
  /// Provider that listens to platform brightness changes using WidgetsBindingObserver
  const PlatformBrightnessProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'platformBrightnessProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$platformBrightnessHash();

  @$internal
  @override
  PlatformBrightness create() => PlatformBrightness();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Brightness value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Brightness>(value),
    );
  }
}

String _$platformBrightnessHash() =>
    r'7522bfd16aacb9dc7ac2a58447cafa1500015ee4';

/// Provider that listens to platform brightness changes using WidgetsBindingObserver

abstract class _$PlatformBrightness extends $Notifier<Brightness> {
  Brightness build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Brightness, Brightness>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Brightness, Brightness>,
              Brightness,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
