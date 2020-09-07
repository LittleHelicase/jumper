import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SpriteAnimation {
  const SpriteAnimation({
    @required this.name,
    @required this.frames,
    @required this.image,
  });

  final String name;
  final int frames;
  final ui.Image image;
}
