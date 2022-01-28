import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/material.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  Flame.util.setLandscape();
  var game=BaseGame();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dino Run'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BaseGame game;

  @override
  void initState() {
    game=BaseGame();
    var dinoSprite=SpriteComponent.square(64, 'DinoSprites_tard.gif');
    dinoSprite.width=128;
    dinoSprite.height=128;
    dinoSprite.x=100;
    dinoSprite.y=100;

    game.add(dinoSprite);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:game.widget,
    );
  }
}
