import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:jumper/components/fancy_button.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Single fancy button should look correct', (tester) async {
      final button = FancyButton(
        child: Container(
            alignment: Alignment.center,
            width: 300,
            child: const Text(
              'Sprites',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            )),
        size: 24,
        color: Colors.purple.shade900,
      );
      await tester.pumpWidgetBuilder(
        Center(child: button),
        surfaceSize: const Size(300, 200),
      );
      await screenMatchesGolden(tester, 'single_fancy_button');
    });
  });
}
