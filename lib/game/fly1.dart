
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:dino_run/game/constants.dart';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class Fly1 extends AnimationComponent {
  //resize(Flame.util.initialDimensions());
  Animation runAnimation;
  double speedX = 0.0;
  double xMax = 0.0;

  Fly1() : super.empty() {
    final _spriteSheet = SpriteSheet(
      imageName: 'empty/Chest.png',
      textureWidth: 48,
      textureHeight: 48,
      columns: 5,
      rows: 2,
    );
    runAnimation =
        _spriteSheet.createAnimation(0, from: 0, to: 4, stepTime: 0.15);
    this.animation = runAnimation;
  }

  void jump() {
    if (isOnGround()) {
      this.speedX = 1000;
    }
  }

  bool isOnGround() {
    return (this.x <= this.xMax);
  }

  @override
  void resize(Size size) {
    this.width = this.height = size.width / numberOfTilesAlongWidth;
    this.x = size.width / numberOfTilesAlongWidth;
    this.y = size.height - groundHeigth - this.height + dinoTopBottomSpacing - 75 ;
    this.xMax = this.x;
    super.resize(size);
  }

  @override
  void update(double t) {
    // v = v + at
    //this.speedY -= GRAVIT * t;
    this.speedX = this.speedX - GRAVIT * t;
    // d = s0 + s * t;
    //this.y += this.speedY * t;
    this.x = this.x + this.speedX * t;
    if (isOnGround()) {
     // print(isOnGround());
      this.x = this.xMax;
      this.speedX = 0.0;
    }
    super.update(t);
  }
}
