import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

Future<ui.Image> imageFromAssets(String filePath) async {
  final asset = await rootBundle.load(filePath);
  final lst = Uint8List.view(asset.buffer);
  final codec = await ui.instantiateImageCodec(lst);
  final frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}
