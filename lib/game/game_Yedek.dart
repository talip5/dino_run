
import 'package:dino_run/game/bat.dart';
import 'package:dino_run/game/enemy_Yedek.dart';
import 'package:dino_run/game/enemy_manager.dart';
import 'package:dino_run/game/fly1.dart';
import 'package:dino_run/game/fly1_enum.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:dino_run/main.dart';
import 'package:dino_run/game/dino.dart';
import 'package:dino_run/game/enemy.dart';
import 'package:dino_run/game/fly.dart';

class DinoGame extends BaseGame with TapDetector{

  ParallaxComponent _parallaxComponent;
  Dino _dino;
  Bat _bat;
  Fly _fly = Fly();
  Fly1 _fly1 = Fly1();
  double time=10.0;
  Size screenSize;
  TextComponent _scoreText;
  int score;
  EnemyManager _enemyManager;

  DinoGame() {
    initialize();
  }
  void initialize() async{
    //resize(await Flame.util.initialDimensions());
    _dino=Dino();
    _bat=Bat();
    //_fly=Fly();
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
    _enemyManager=EnemyManager();
    add(_enemyManager);
    //add(_bat.dinoSprite);
    //add(_fly);
    //add(_fly1);
    //var enemy=  Fly1Enum(EnemyType.AngryPig);
    //add(enemy);
    score=0;
    _scoreText=TextComponent(score.toString());
    add(_scoreText);
  }
  @override
  void onTapDown(TapDownDetails details) {
    _dino.jump();
    _fly1.jump();
    //Fly1Enum(EnemyType.AngryPig).jump();
    super.onTapDown(details);
  }
  @override
  void update(double t) {
    super.update(t);
    score += (60 * t).toInt();
    _scoreText.text=score.toString();
  }
  @override
  void resize(Size size) {
    _scoreText.setByPosition(Position((size.width/2 - _scoreText.width/2), 0));
    screenSize=size;
    //print(screenSize);
    super.resize(size);
  }
}