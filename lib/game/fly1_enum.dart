/*
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:dino_run/game/constants.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

enum EnemyType { AngryPig, Bat, Rino }

class EnemyData {
  final String imageName;
  final int textureWidth;
  final int textureHeight;
  final int nColumns;
  final int nRows;

  const EnemyData({
    @required this.imageName,
    @required this.textureWidth,
    @required this.textureHeight,
    @required this.nColumns,
    @required this.nRows,
  });
}

class Fly1Enum extends AnimationComponent {
  double speedX = 0.0;
  double xMax = 0.0;
  int textureWidth;
  int textureHeight;

  static const Map<EnemyType, EnemyData> _enemyDetails = {
    EnemyType.AngryPig: EnemyData(
      imageName: 'AngryPig/Walk (36x30).png',
      textureWidth: 36,
      textureHeight: 30,
      nColumns: 16,
      nRows: 1,
    ),
    EnemyType.Bat: EnemyData(
      imageName: 'Bat/Flying (46x30).png',
      textureWidth: 46,
      textureHeight: 30,
      nColumns: 7,
      nRows: 1,
    ),
    EnemyType.Rino: EnemyData(
      imageName: 'Rino/Run (52x34).png',
      textureWidth: 52,
      textureHeight: 30,
      nColumns: 6,
      nRows: 1,
    ),
  };

  Fly1Enum(EnemyType enemyType) : super.empty() {
    final enemyData = _enemyDetails[enemyType];
    initialize();
    final _spriteSheet = SpriteSheet(
      imageName: enemyData.imageName,
      textureWidth: enemyData.textureWidth,
      textureHeight: enemyData.textureHeight,
      columns: enemyData.nColumns,
      rows: enemyData.nRows,
    );
    this.animation = _spriteSheet.createAnimation(0,
        from: 0, to: (enemyData.nColumns - 1), stepTime: 0.15);
    textureWidth = enemyData.textureWidth;
    textureHeight = enemyData.textureHeight;
  }

  void jump() {
    if (isOnGround()) {
      this.speedX = 1000;
    }
  }

  initialize(){

  }

  bool isOnGround() {
    return (this.x <= this.xMax);
  }

  @override
  void resize(Size size) {
    double scaleFactor = (size.width / numberOfTilesAlongWidth) / textureWidth;
    this.height = textureHeight * scaleFactor;
    this.width = textureWidth * scaleFactor;
    this.x = size.width;
    this.y =
        size.height - groundHeigth - this.height + dinoTopBottomSpacing - 75;
    this.xMax = this.x;
    super.resize(size);
  }

  @override
  void update(double t) {
    //print('initialize : ${speedX}');
    // v = v + at
    //this.speedY -= GRAVIT * t;
    //this.speedX = this.speedX - GRAVIT * t;
    // d = s0 + s * t;

    //this.y += this.speedY * t;
    //this.x = this.x + this.speedX * t;
    if (isOnGround()) {
     //print(isOnGround());
      this.x = this.x - (GRAVIT/10) * t;
      if(this.x < - this.width){
        this.x = this.xMax;
      }
      //this.speedX = 0.0;
    }
    super.update(t);
  }
}
*/
