import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Modules add and change properties of a level.
/// The idea is, that each Level can have custom mechanics
/// but for one level the modules will never change.
///
/// A module might be something like movement physics
/// screen scrolling mechanics or enemy behavior.
class Module {
  /// Constructor
  const Module({@required this.name, @required this.id});

  /// Name used for displaying it
  final String name;

  /// Unique ID identifying the module
  final Uuid id;
}
