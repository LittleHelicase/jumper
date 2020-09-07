import 'package:flutter/material.dart';

class JumperScaffold extends StatelessWidget {
  const JumperScaffold({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.8, 0.0),
              colors: [
                Colors.purple.shade200,
                Colors.purple.shade800,
              ], // repeats the gradient over the canvas
            ),
          ),
          child: Center(child: child)));
}
