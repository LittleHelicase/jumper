import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumper/render/renderer.dart';

class AssetRenderer implements Renderer {
  AssetRenderer(@required String asset) {
    rootBundle.load('assets/sprites/owlet/Owlet_Monster.png').then((bd) {
      Uint8List lst = new Uint8List.view(bd.buffer);
      ui.instantiateImageCodec(lst).then((codec) {
        codec.getNextFrame().then((frameInfo) {
          _assetImage = frameInfo.image;
        });
      });
    });
  }

  ui.Image _assetImage;

  void render(Canvas canvas, double t) {
    if (_assetImage != null) {
      canvas.drawImage(_assetImage, const Offset(0, 0), Paint());
    }
  }
}
