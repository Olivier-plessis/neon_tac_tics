import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_tactics/src/core/theme/app_theme.dart';
import 'package:neon_tactics/src/presentation/page/home_page.dart';

void main() {
  Widget createWidgetUnderTest() {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(400, 1000), // Larger size to avoid layout issues
        builder: (context, child) => MaterialApp(theme: AppTheme.light, home: const HomePage()),
      ),
    );
  }

  testWidgets('HomePage should allow entering name and proceeding with difficulty', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
    // HomeNotifier has a 3x800ms = 2400ms sequence before showing input
    await tester.pump(const Duration(seconds: 4));

    // Verify initial state
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter name
    await tester.enterText(find.byType(TextField), 'Test Pilot');
    await tester.pump();

    // Tap the ElevatedButton directly
    await tester.tap(find.byType(ElevatedButton));

    // Process transition
    await tester.pump(); // Handle state update pulse
    await tester.pump(const Duration(seconds: 2)); // Wait for animation and logic

    // Check if we reached difficulty screen - TextField should be GONE
    expect(find.byType(TextField), findsNothing);

    // Verify difficulty state
    expect(find.textContaining('niveau'), findsOneWidget);
    expect(find.textContaining('SIMPLE'), findsOneWidget);

    // Select difficulty (ELITE)
    await tester.tap(find.textContaining('ELITE'));

    // Process transition and delay logic
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    // After difficulty is selected and the delay passes, HomePage shows access granted
    expect(find.textContaining('GRANTED'), findsOneWidget);
  });
}
