import 'dart:async';
import 'dart:math';

import 'package:first_flutter_game/background.dart';
import 'package:first_flutter_game/pipes.dart';
import 'package:first_flutter_game/player.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame with TapCallbacks, HasCollisionDetection {
  Random random = Random();
  Player player = Player();
  bool isgameover = false;
  Pipe topPipe = Pipe(isTop: true, size: Vector2(50, 150));
  Pipe botPipe = Pipe(isTop: false, size: Vector2(50, 150));
  MyGame() : super();
  @override
  FutureOr<void> onLoad() async {
    world.add(City());
    world.add(Ground());
    world.add(botPipe);
    world.add(topPipe);
    world.add(player);
    updatePipeSize();
    debugMode = true;
    return super.onLoad();
  }

  void updatePipeSize() {
    double min = random.nextInt(100) + 50;
    double max = random.nextInt(200) + 100;
    topPipe.size.y = min + max;
    botPipe.size.y = camera.viewport.size.y - 120 - topPipe.size.y - 150;
  }

  @override
  void onTapDown(TapDownEvent event) {
    player.jump();

    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    if (isgameover) {
      pauseEngine();
    }
    topPipe.position.x -= 100 * dt;
    botPipe.position.x -= 100 * dt;

    if (topPipe.position.x < -250) {
      topPipe.removeFromParent();
      botPipe.removeFromParent();
      topPipe.position.x = 250;
      botPipe.position.x = 250;
      updatePipeSize();
      world.add(topPipe);
      world.add(botPipe);
    }
    super.update(dt);
  }

  @override
  Color backgroundColor() {
    return const Color(0xff111111);
  }
}
