import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, {required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween();
    final scene = tween.scene(
        duration: const Duration(milliseconds: 700), curve: Curves.easeOut);
    scene.tween(AniProps.opacity, Tween(begin: 0.0, end: 1.0));
    scene.tween(
      AniProps.translateY,
      Tween(begin: -30.0, end: 0.0),
    );
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, animation, child) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, animation.get(AniProps.translateY)),
            child: child),
      ),
    );
  }
}
