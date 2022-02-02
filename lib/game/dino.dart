
import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';
import 'package:flutter/foundation.dart';
import 'package:dino_run/game/constants.dart';

class Dino extends AnimationComponent {

  Animation _runAnimation;
  Animation _hitAnimation;
  Timer _timer;
  bool _isHit;

  double speedY=0.0;
  double yMax=0.0;

  Dino() :super.empty() {
    // 0 - 3 = idle
    // 4 - 10 = run
    // 11 - 13 = kick
    // 14 - 16 = hit
    // 17 - 23 = sprint


    final spriteSheet = SpriteSheet(
        imageName: 'DinoSprites - tard.png',
        textureHeight: 24,
        textureWidth: 24,
        columns: 24,
        rows: 1);

    _runAnimation=
    spriteSheet.createAnimation(0,from: 4,to: 10,stepTime: 0.1);
    _hitAnimation=
    spriteSheet.createAnimation(0,from: 14,to:16,stepTime: 0.1);

    this.animation=_runAnimation;

    _timer=Timer(1,callback: (){
      run();
      print('start');
    });
    _isHit=false;
    //this.anchor=Anchor.center;
  }
  @override
  void resize(Size size) {
    this.width = this.height = size.width / numberOfTilesAlongWidth;
    this.x = this.width;
    this.y = size.height - groundHeigth - (this.height / 2)  - dinoTopBottomSpacing;
    this.yMax = this.y;
    super.resize(size);
  }

  bool isOnGround(){
    return(this.y >= this.yMax);
  }
  void run(){
    _isHit=false;
    this.animation = _runAnimation;
  }
  void hit(){
    if(!_isHit){
      this.animation = _hitAnimation;
      _timer.start();
      _isHit=true;
    }
  }
  void jump(){
    if(isOnGround()) {
      this.speedY = -600;
    }
  }
  @override
  void update(double t) {
    // v = v + at
    this.speedY +=GRAVIT * t;
    // d = s0 + s * t;
    this.y += this.speedY * t;
    if(isOnGround()){
      this.y = this.yMax;
      this.speedY = 0.0;
    }
    _timer.update(t);
    super.update(t);
  }
}