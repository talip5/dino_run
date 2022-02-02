
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Bat extends SpriteComponent{
var dinoSprite;
  Bat(){
 dinoSprite=SpriteComponent.square(64,'DinoSprites_tard.gif');
 //dinoSprite=SpriteComponent.square(64,'dino20.png');
  }
}