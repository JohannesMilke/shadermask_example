import 'package:flutter/material.dart';
import 'package:shadermask_example/main.dart';

class RadialGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ShaderMask(
          blendMode: BlendMode.screen,
          shaderCallback: (rect) => RadialGradient(
            radius: 0.8,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ).createShader(rect),
          child: Image.network(urlImage, fit: BoxFit.cover),
        ),
      );
}
