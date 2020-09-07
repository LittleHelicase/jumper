import 'dart:ui';

import 'package:flame/game/game.dart';

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:jumper/render/renderer.dart';

class JumpView extends Game {
  JumpView({this.renderer});

  List<Renderer> renderer;

  Size size;
  double t = 0;

  @override
  void render(Canvas canvas) {
    final linearGradient = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(size.width, size.height),
        [
          Colors.blue,
          Colors.green,
        ],
      );
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), linearGradient);

    renderer?.forEach((renderer) => renderer.render(canvas, t));
  }

  @override
  void resize(Size size) {
    super.resize(size);
    this.size = size;
  }

  @override
  void update(double t) {
    this.t += t;
    // TODO: implement update
  }
}
