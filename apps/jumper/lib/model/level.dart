import 'package:flutter/material.dart';

import 'module.dart';

/// A level contains a set of items (TBD) has a certain size
/// and active modules.
class Level {
  /// Constructor
  const Level({@required this.modules, @required this.levelSize});

  /// size of the level (in tiles ?)
  final Size levelSize;

  /// modules that are active in this level
  final Map<String, Module> modules;
}
