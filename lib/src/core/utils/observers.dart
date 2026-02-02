import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class L {
  static void log(dynamic msg) {
    final Logger logger = Logger();
    logger.log(Level.debug, msg);
  }
}

base class Observers extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    L.log('''
    {
      "provider": "${context.provider.name ?? context.provider.runtimeType}",
      "value": "$value"
    }''');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    L.log('''
    {
      "provider": "${context.provider.name ?? context.provider.runtimeType}",
      "newValue": "$newValue"
    }''');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    L.log('''
    {
      "provider": "${context.provider.name ?? context.provider.runtimeType}"
    }''');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    L.log('''
    {
      "provider": "${context.provider.name ?? context.provider.runtimeType}",
      "error": "$error",
      "stackTrace": "$stackTrace"
    }''');
  }
}
