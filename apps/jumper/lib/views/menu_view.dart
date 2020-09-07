import 'package:flutter/material.dart';
import 'package:jumper/components/jumper_scaffold.dart';
import 'package:jumper/views/sprite_view.dart';

class MenuView extends StatelessWidget {
  const MenuView();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: const Text('Sprites'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JumperScaffold(
                            child: SpriteView(
                                'assets/images/sprites/owlet/owlet.json'),
                          )));
            },
          ),
        ],
      );
}
