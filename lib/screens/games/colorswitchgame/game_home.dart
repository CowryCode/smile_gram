import 'package:flame/events.dart' show TapCallbacks, TapDownEvent;
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGame());
  }
}

