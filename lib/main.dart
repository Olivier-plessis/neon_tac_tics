import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neon_tactics/src/app.dart';
import 'package:neon_tactics/src/core/utils/observers.dart';
import 'package:neon_tactics/src/core/utils/register_error_handler.dart';
import 'package:neon_tactics/src/core/utils/shared_preference_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  registerErrorHandler();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      final sharedPreferences = await SharedPreferences.getInstance();

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(AsyncValue.data(sharedPreferences)),
        ],
        observers: <ProviderObserver>[Observers()],
      );
      runApp(UncontrolledProviderScope(container: container, child: MainApp()));
    },
    (error, stackTrace) async {
      L.log('$error - $stackTrace');
    },
  );
}
