import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/material.dart';
import 'package:dino_run/game/game.dart';

void main() async{
 await WidgetsFlutterBinding.ensureInitialized();
 await Flame.util.fullScreen();
 Flame.util.setLandscape();
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
  DinoGame game;

  @override
  void initState() {
    game=DinoGame();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:game.widget,
       );
  }
}
