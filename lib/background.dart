import 'dart:async';

import 'package:first_flutter_game/main.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class City extends ParallaxComponent<MyGame> with HasGameRef<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('background-day.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(5, 1.0),
    );
    return super.onLoad();
  }
}

class Ground extends ParallaxComponent<MyGame>
    with HasGameRef<MyGame>, CollisionCallbacks {
  double height=120;
  @override
  FutureOr<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('base.png'),
      ],
      fill: LayerFill.width,
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(5, 1.0),
    );
    add(RectangleHitbox(
      anchor: Anchor.center,
      size: Vector2(800, height),
      position: Vector2(0, 740),
      collisionType: CollisionType.passive,
    ));
    return super.onLoad();
  }
}
