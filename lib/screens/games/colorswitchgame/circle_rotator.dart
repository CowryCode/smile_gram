import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'dart:math' as math;

class CircleRotator extends PositionComponent with HasGameReference<MyGame> {
  CircleRotator({
    required super.position,
    required super.size,
    this.thickness = 8,
  })  : assert(size!.x == size!.y),
        super(anchor: Anchor.center);

  final double thickness;

  @override
  void onLoad(){
    super.onLoad();

    const circle = math.pi * 2;
    final sweep = circle / game.gameColors.length;

    for (int i = 0; i < game.gameColors.length; i++){
      add(CircleArc(
          color: game.gameColors[i],
          startAngle: i * sweep,
          sweepAngle: sweep
      )
      );
    }
  }

  @override
  void render(Canvas canvas) {
    // final radius = (size.x / 2) - (thickness / 2);
    // (canvas.drawArc(
    //     size.toRect(),
    //     0,
    //     3.13,
    //     false,
    //     Paint()
    //       ..color = Colors.redAccent
    //       ..style = PaintingStyle.stroke
    //       ..strokeWidth = thickness));
    // canvas.drawCircle(
    //   (size/2).toOffset(),
    //   radius,
    //   Paint()
    //     ..color = Colors.blueAccent
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = thickness,
    // );
  }
}

class CircleArc extends PositionComponent with ParentIsA<CircleRotator> {
  final Color color;
  final double startAngle;
  final double sweepAngle;

  CircleArc(
      {required this.color,
      required this.startAngle,
      required this.sweepAngle
      }) : super(anchor : Anchor.center);

  @override
  void onMount() {
    size = parent.size;
    position = size / 2;
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawArc(
        size.toRect().deflate(parent.thickness / 2),
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = parent.thickness);
  }
}
