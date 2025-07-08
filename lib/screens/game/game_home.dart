import 'package:flame/components.dart';
import 'package:flame/events.dart' show TapCallbacks, TapDownEvent;
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

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

class Player extends PositionComponent {
  // final speed = 30.0;
  final _velocity = Vector2(0, 30.0);
  final _gravity = 980;
  final _jumpspeed = 300.0;

  @override
  void onMount(){
    position = Vector2(150,100);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
     _velocity.y += _gravity * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
        position.toOffset(),
        15,
        Paint()..color = Colors.yellow,
    );
  }

  void jump(){
    _velocity.y = -_jumpspeed;
  }
}

// class Player extends Component{
//   final speed = 30.0;
//   double x = 100;
//   double y = 100;
//   @override
//   void update(double dt){
//     // dt -> Delta Time: This means how much time has past since the previous frame
//     // For a 60fps device -> this method is called 60 times in a second -> dt: 0.01667
//     // For a 120fps device -> this method is called 120 times in a second -> dt: 0.00833
//     // To maintain constant speed of objects across different device, y += speed * dt
//     //TODO: implement update
//     // print('MyComponent.update');
//     // y += speed;
//     super.update(dt);
//   }
//
//   @override
//   void render(Canvas canvas){
//     // print('MyComponent.render');
//     super.render(canvas);
//     canvas.drawCircle(Offset(x,y), 15, Paint()..color = Colors.yellow);
//   }
//
// }
