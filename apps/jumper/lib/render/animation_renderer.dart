import 'package:flutter/material.dart';
import 'package:jumper/render/renderer.dart';
import 'package:jumper/sprite/sprite_animation.dart';

class SpriteAnimationRenderer implements Renderer {
  const SpriteAnimationRenderer({
    @required this.animation,
    @required this.runtime,
    @required this.offset,
  });

  final SpriteAnimation animation;
  final double runtime;
  final Offset offset;

  @override
  void render(Canvas canvas, double t) {
    final frame = ((t % runtime) * animation.frames).floor();
    final frameSize = animation.image.height.toDouble();
    canvas.drawImageRect(
        animation.image,
        Rect.fromLTWH(
            (frame % animation.frames) * frameSize, 0, frameSize, frameSize),
        Rect.fromLTWH(offset.dx, offset.dy, frameSize * 5, frameSize * 5),
        Paint());
  }
}
