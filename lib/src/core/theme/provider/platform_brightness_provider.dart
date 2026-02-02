import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platform_brightness_provider.g.dart';

/// Provider that listens to platform brightness changes using WidgetsBindingObserver
@riverpod
class PlatformBrightness extends _$PlatformBrightness with WidgetsBindingObserver {
  @override
  Brightness build() {
    // Register the observer
    WidgetsBinding.instance.addObserver(this);
    
    // Clean up when provider is disposed
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
    });
    
    // Return initial brightness
    return WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  void didChangePlatformBrightness() {
    final newBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (state != newBrightness) {
      state = newBrightness;
    }
  }
}
