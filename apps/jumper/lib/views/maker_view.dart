import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MakerView extends StatefulWidget {
  const MakerView();

  @override
  _MakerViewState createState() => _MakerViewState();
}

class _MakerViewState extends State<MakerView> {
  Widget _card(Widget child) => SizedBox(
      width: 400,
      height: 600,
      child: Card(
        elevation: 3,
        child: Stack(children: [child]),
      ));

  @override
  Widget build(BuildContext context) => _card(Builder(builder: (context) {
        final editor = MakerEditor();
        return SafeArea(child: ClipRect(child: editor.widget));
      }));
}

class MakerEditor extends BaseGame with PanDetector, KeyboardEvents {
  MakerEditor() {
    initSprites();
    add(SpriteComponent.fromSprite(64, 64, spriteSheet.getSprite(0, 3))
      ..x = 64
      ..y = 64);
    add(SpriteComponent.fromSprite(64, 64, spriteSheet.getSprite(11, 6))
      ..x = 128
      ..y = 64);

    add(GridComponent());
  }

  double dx = 0;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);

    camera.x += dx;
    if (dx > 0) {
      dx = dx - 1;
    } else if (dx < 0) {
      dx = dx + 1;
    }
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    camera.x -= details.delta.dx;
  }

  @override
  void onKeyEvent(RawKeyEvent keyEvent) {
    final logicalKey = keyEvent.data.logicalKey;
    if (logicalKey == LogicalKeyboardKey.arrowLeft) {
      dx = dx - 5;
    } else if (logicalKey == LogicalKeyboardKey.arrowRight) {
      dx = dx + 5;
    }
  }

  SpriteSheet spriteSheet;

  void initSprites() {
    spriteSheet = SpriteSheet(
        imageName: 'sprites/external/38190_sprites.png',
        textureWidth: 128 ~/ 16,
        textureHeight: 128 ~/ 16,
        columns: 16,
        rows: 16);
  }
}

class GridComponent extends PositionComponent {
  double maxY = 0.0;

  @override
  void render(Canvas canvas) {
    const offsetX = 64.0;
    const offsetY = 64.0;
    final linePaint = Paint()
      ..color = Colors.grey.shade700.withOpacity(0.5)
      ..strokeWidth = 4;
    for (int x = 0; x < 20; x += 1) {
      canvas.drawLine(
          Offset(x * offsetX, 0), Offset(x * offsetX, maxY), linePaint);
    }
    for (int y = 0; y < 20; y += 1) {
      canvas.drawLine(
          Offset(0, y * offsetY), Offset(1000, y * offsetY), linePaint);
    }
  }

  @override
  void resize(Size size) {
    // print("resize: ${size.height}");
    maxY = size.height;
  }
}
