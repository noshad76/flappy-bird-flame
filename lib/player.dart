import 'dart:async';
import 'dart:ui';
import 'package:first_flutter_game/main.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  Vector2 speed = Vector2(0, 30);
  double gravity = 980;
  double jumpSpeed = 300;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bluebird-midflap.png');
    add(RectangleHitbox(
      size: Vector2(size.x, size.y),
      anchor: Anchor.topLeft,
      collisionType: CollisionType.active,
    ));
    return super.onLoad();
  }

  @override
  void onMount() {
    position = Vector2(-125, 0);
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    gameRef.isgameover = true;
    super.onCollision(intersectionPoints, other);
  }

  @override
  void render(Canvas canvas) {
    sprite!.render(canvas);
    super.render(canvas);
  }

  void jump() {
    speed.y = 30;
    speed.y -= jumpSpeed;
  }

  void goDown(dt) {
    speed.y += gravity * dt;
    position += speed * dt;
  }

  @override
  void update(double dt) {
    goDown(dt);
    super.update(dt);
  }
}
