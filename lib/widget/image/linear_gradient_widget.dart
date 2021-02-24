import 'package:flutter/material.dart';
import 'package:shadermask_example/main.dart';

class LinearGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ShaderMask(
          blendMode: BlendMode.color,
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red,
              Colors.green,
            ],
          ).createShader(rect),
          child: Image.network(urlImage, fit: BoxFit.cover),
        ),
      );
}
