
import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:smileapp/screens/games/colorswitchgame/player.dart' show Player;
class MyGame extends FlameGame with TapCallbacks{
  late Player myPlayer;

  @override
  Color backgroundColor() => const Color(0xff222222);

  // @override
  // void onGameResize(Vector2 size){
  //   super.onGameResize(size);
  //   print(size);
  // }
  @override
  void onMount() {
    add(myPlayer = Player());
    super.onMount();
  }

  @override
  void onTapDown(TapDownEvent event){
    print('onTap Down Event');
    myPlayer.jump();
    super.onTapDown(event);
  }
}