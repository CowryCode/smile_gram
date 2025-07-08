
import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:smileapp/screens/games/colorswitchgame/player.dart' show Player;
class MyGame extends FlameGame with TapCallbacks{
  late Player myPlayer;

  MyGame() : super(
      camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000
      )
  );

  @override
  Color backgroundColor() => const Color(0xff222222);

  // @override
  // void onGameResize(Vector2 size){
  //   super.onGameResize(size);
  //   print(size);
  // }
  @override
  void onMount() {
    //add(myPlayer = Player());
    // world.add(RectangleComponent(position: Vector2(-1000, -1000), size: Vector2(99999,999999)));
    world.add(myPlayer = Player()); // camera has the world function so once we introduced camaera, we added word (Video 3)
    world.add(RectangleComponent(position: Vector2(-100, -100), size: Vector2.all(20)));
    world.add(RectangleComponent(position: Vector2(-200, 100), size: Vector2.all(20)));
    world.add(RectangleComponent(position: Vector2(-300, 0), size: Vector2.all(20)));
    world.add(RectangleComponent(position: Vector2(200, 100), size: Vector2.all(20)));
    // debugMode = true;
    super.onMount();
  }

  @override
  void update(double dt){
    final cameraY = camera.viewfinder.position.y;
    final playerY = myPlayer.position.y;
    if (playerY < cameraY){
      camera.viewfinder.position = Vector2(0, playerY);
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event){
    print('onTap Down Event');
    myPlayer.jump();
    super.onTapDown(event);
  }
}