import 'package:flutter/material.dart';
import 'package:jumper/components/fancy_button.dart';
import 'package:jumper/components/jumper_page_route.dart';
import 'package:jumper/components/jumper_scaffold.dart';
import 'package:jumper/views/sprite_view.dart';

class MenuView extends StatelessWidget {
  const MenuView();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FancyButton(
            child: Container(
                alignment: Alignment.center,
                width: 300,
                child: Text(
                  'Sprites',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                )),
            size: 24,
            color: Colors.purple.shade900,
            onPressed: () {
              Navigator.push(
                  context,
                  JumperPageRoute(
                      builder: (context) => const Scaffold(
                            body: Center(
                                child: SpriteView(
                                    'assets/images/sprites/owlet/owlet.json')),
                            backgroundColor: Colors.transparent,
                          )));
            },
          ),
        ],
      );
}
