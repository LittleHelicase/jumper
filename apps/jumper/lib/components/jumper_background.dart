import 'package:flutter/material.dart';

class JumperBackground extends StatelessWidget {
  const JumperBackground({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 0.0),
            colors: [
              Colors.purple.shade200,
              Colors.purple.shade800,
            ], // repeats the gradient over the canvas
          ),
        )),
        child,
      ]);
}
