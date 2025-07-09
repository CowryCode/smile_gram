import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Colors;

class Ground extends PositionComponent {
  static const String keyName = 'single_ground_key';
  Ground({required super.position})
      : super(
          size: Vector2(200, 1),
          anchor: Anchor.center,
    key: ComponentKey.named(keyName),
        );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, width, height),
      Paint()..color = Colors.red,
    );
  }
}
