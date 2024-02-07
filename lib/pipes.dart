import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'dart:math' as math;

class Pipe extends SpriteComponent {
  Pipe({
    required this.isTop,
    required super.size,
  });
  bool isTop;
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('pipe-green.png');

    if (isTop) {
      angle = math.pi;
      anchor = Anchor.bottomCenter;
      position = Vector2(250, -410);
      add(RectangleHitbox());
    } else {
      anchor = Anchor.bottomCenter;
      position = Vector2(250, 275);
      add(RectangleHitbox());
    }

    return super.onLoad();
  }
}




// class Pipe extends SpriteComponent {
//   Pipe({required this.isTop, super.size,super.position});
//   bool isTop;
//   @override
//   FutureOr<void> onLoad() async {
//     sprite = await Sprite.load('pipe-green.png');
//     if (isTop) {
//       angle = math.pi;
//       anchor = Anchor.bottomCenter;
//       position = Vector2(x, -410);
//       add(RectangleHitbox(
//           position: Vector2(position.x, 300),
//           anchor: Anchor.topRight,
//           angle: math.pi,
//           size: Vector2(50, 300),));
//     } else {
//       anchor = Anchor.bottomCenter;
//       position = Vector2(x, 275);
//       add(RectangleHitbox(
//           position: Vector2(position.x, 300),
//           anchor: Anchor.bottomLeft,
//           size: Vector2(50, 300)));
//     }

//     size = Vector2(50, 300);
//     return super.onLoad();
//   }
// }
