import 'package:flame/animation.dart' as animation;
import 'package:flame/widgets/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:jumper/sprite/sprite.dart';

class SpriteView extends StatefulWidget {
  const SpriteView(@required this.spriteAssetFile);

  final String spriteAssetFile;

  @override
  _SpriteViewState createState() => _SpriteViewState();
}

class _SpriteViewState extends State<SpriteView> {
  String selectedSprite = 'default';
  double _zoomValue = 1;

  Widget _card(Widget child) => SizedBox(
      width: 400,
      height: 600,
      child: Card(
          elevation: 3,
          child: Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Column(children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                const Text('Sprite View', style: TextStyle(fontSize: 28)),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Expanded(child: child),
              ]),
            ],
          )));

  @override
  Widget build(BuildContext context) => _card(FutureBuilder<Sprite>(
      future: Sprite.fromAssets(widget.spriteAssetFile),
      builder: (context, spriteSnapshot) => Stack(children: [
            if (!spriteSnapshot.hasData && !spriteSnapshot.hasError)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.grey,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            // Todo fix ugly alignment
            Column(
              key: Key('controls'),
              children: [
                Text(
                  spriteSnapshot.hasData ? spriteSnapshot.data.name : '...',
                  style: TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Sprite Set:'),
                    DropdownButton<String>(
                      value: selectedSprite,
                      icon: Icon(Icons.arrow_downward),
                      items: (spriteSnapshot.hasData
                              ? spriteSnapshot.data.animations.keys.toList()
                              : ['default'])
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedSprite = selected;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Zoom'),
                    Slider(
                      value: _zoomValue,
                      min: 0.1,
                      max: 10,
                      divisions: 100,
                      label: _zoomValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _zoomValue = value;
                        });
                      },
                    ),
                  ],
                ),
                if (spriteSnapshot.hasData)
                  Flexible(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: DecoratedBox(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 1)),
                              child: SizedBox(
                                  width: spriteSnapshot.data.width * _zoomValue,
                                  height:
                                      spriteSnapshot.data.height * _zoomValue,
                                  child: AnimationWidget(
                                    animation:
                                        _selectedAnimation(spriteSnapshot.data),
                                    playing: true,
                                  ))))),
                // child: JumpView(renderer: [
                //   if (spriteSnapshot.hasData)
                //     SpriteAnimationRenderer(
                //         animation: _selectedAnimation(
                //             spriteSnapshot.data),
                //         runtime: 2.0,
                //         offset: Offset(100, 100)),
                // ]).widget))),
                if (spriteSnapshot.hasError)
                  Text('Error while loading sprite ${spriteSnapshot.error}'),
              ],
            )
          ])));

  animation.Animation _selectedAnimation(Sprite sprite) =>
      sprite.animations[selectedSprite];
}

Widget printLayout(Widget child) => LayoutBuilder(builder: (ctx, constr) {
      print(constr.biggest);
      print(constr.smallest);
      return child;
    });
