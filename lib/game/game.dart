
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:dino_run/main.dart';
import 'package:dino_run/game/dino.dart';
import 'package:dino_run/game/enemy.dart';

class DinoGame extends BaseGame with TapDetector{

  ParallaxComponent _parallaxComponent;
  Dino _dino;

  DinoGame(){
    //TODO : Move _dino to Dino class
    _dino=Dino();

    _parallaxComponent=ParallaxComponent(
      [
        ParallaxImage('parallax/plx-1.png'),
        ParallaxImage('parallax/plx-2.png'),
        ParallaxImage('parallax/plx-3.png'),
        ParallaxImage('parallax/plx-4.png'),
        ParallaxImage('parallax/plx-5.png'),
        ParallaxImage('parallax/plx-6.png',fill: LayerFill.none),
      ],
      baseSpeed: Offset(100,0),
      layerDelta: Offset(20,0),
    );

    add(_parallaxComponent);
    add(_dino);
    var enemy=Enemy(EnemyType.Rino);
    add(enemy);
  }
@override
  void onTapDown(TapDownDetails details) {
   _dino.jump();
    super.onTapDown(details);
  }
}