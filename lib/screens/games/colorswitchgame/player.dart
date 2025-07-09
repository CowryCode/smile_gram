
import 'dart:ui';

import 'package:flame/components.dart' show PositionComponent, Vector2, Vector2Extension, Anchor, HasGameRef, HasGameReference;
import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';
import 'package:smileapp/screens/games/colorswitchgame/ground.dart';

import 'game.dart';

class Player extends PositionComponent with HasGameReference<MyGame> {
  Player({
    this.playerRadious = 15,
  });

  final _velocity = Vector2(0, 0); // Vector2.zero();
  final _gravity = 980;
  final _jumpspeed = 300.0;
  final double playerRadious;

  @override
  void onMount(){
    position = Vector2(0,0);
    size = Vector2.all(playerRadious * 2);
    anchor = Anchor.center;
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;

     Ground ground = game.findByKeyName(Ground.keyName) as Ground;

     if(positionOfAnchor(Anchor.bottomCenter).y > ground.position.y){
       _velocity.setValues(0,0);
       position = Vector2(0, ground.position.y - (height / 2));
     }else{
       _velocity.y += _gravity * dt;
     }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
      // position.toOffset(),
      (size/2).toOffset(),
      playerRadious,
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
