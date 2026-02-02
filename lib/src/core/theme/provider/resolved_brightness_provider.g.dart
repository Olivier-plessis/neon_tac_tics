// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_brightness_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that returns the actual resolved brightness (Light or Dark)
/// based on the user's ThemeMode and the system's PlatformBrightness.

@ProviderFor(resolvedBrightness)
const resolvedBrightnessProvider = ResolvedBrightnessProvider._();

/// Provider that returns the actual resolved brightness (Light or Dark)
/// based on the user's ThemeMode and the system's PlatformBrightness.

final class ResolvedBrightnessProvider
    extends $FunctionalProvider<Brightness, Brightness, Brightness>
    with $Provider<Brightness> {
  /// Provider that returns the actual resolved brightness (Light or Dark)
  /// based on the user's ThemeMode and the system's PlatformBrightness.
  const ResolvedBrightnessProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolvedBrightnessProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolvedBrightnessHash();

  @$internal
  @override
  $ProviderElement<Brightness> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Brightness create(Ref ref) {
    return resolvedBrightness(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Brightness value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Brightness>(value),
    );
  }
}

String _$resolvedBrightnessHash() =>
    r'690f1df9014ee3c877a3bc9e4f8d4332218509db';
