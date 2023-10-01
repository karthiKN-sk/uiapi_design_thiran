import 'package:flutter/material.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;
}

class HeroWidget extends StatelessWidget {
  final Widget child;
  final String tag;
  const HeroWidget({super.key, required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: child,
    );
  }
}
