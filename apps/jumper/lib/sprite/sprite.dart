import 'dart:convert';

import 'package:flame/animation.dart' as animation;
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumper/sprite/sprite_animation.dart';
import 'package:jumper/util/asset_image.dart';
import 'package:path/path.dart' as path;

class Sprite {
  const Sprite({
    @required this.name,
    @required this.animations,
    @required this.width,
    @required this.height,
  });

  static Future<Sprite> fromAssets(String configFile) async {
    final configJson = json.decode(await rootBundle.loadString(configFile));
    final sets = configJson['sets'] ?? [];
    return Sprite(
        name: configJson['name'],
        width: configJson['width'].toDouble(),
        height: configJson['height'].toDouble(),
        animations: Map.fromEntries(await Future.wait(sets
            .map<Future<MapEntry<String, animation.Animation>>>(
                (spriteSet) async {
          final fileName = path
              .join(path.dirname(configFile), spriteSet['file'])
              .replaceAll('assets/images/', '');
          await Flame.images.load(fileName);
          return MapEntry<String, animation.Animation>(
              spriteSet['name'],
              animation.Animation.sequenced(
                fileName,
                spriteSet['frames'] ?? 1,
                textureHeight: 32,
                textureWidth: 32,
              ));
          // final image = await imageFromAssets(
          //     path.join(path.dirname(configFile), spriteSet['file']));
          // return SpriteAnimation(
          //     name: spriteSet['name'],
          //     frames: image.width ~/ image.height,
          //     image: image);
        }))));
  }

  final String name;
  final Map<String, animation.Animation> animations;
  final double width;
  final double height;
}
