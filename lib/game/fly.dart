import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:dino_run/game/constants.dart';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class Fly extends AnimationComponent {
  //resize(Flame.util.initialDimensions());
  Animation runAnimation;
  double speedY = 0.0;
  double yMax = 0.0;

  Fly() : super.empty() {
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
      this.speedY = -600;
    }
  }

  bool isOnGround() {
    return (this.y >= this.yMax);
  }

  @override
  void resize(Size size) {
    this.width = this.height = size.width / numberOfTilesAlongWidth;
    this.x = this.width;
    this.y = size.height - groundHeigth - this.height + dinoTopBottomSpacing;
    this.yMax = this.y;
    super.resize(size);
  }

  @override
  void update(double t) {
      // v = v + at
      //this.speedY += GRAVIT * t;
      this.speedY = this.speedY + GRAVIT * t;
      // d = s0 + s * t;
      //this.y += this.speedY * t;
      this.y = this.y + this.speedY * t;
      if (isOnGround()) {
        this.y = this.yMax;
        this.speedY = 0.0;
      }
    super.update(t);
  }
}
