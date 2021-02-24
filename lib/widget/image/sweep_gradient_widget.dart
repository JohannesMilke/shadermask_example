import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shadermask_example/main.dart';

class SweepGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ShaderMask(
        blendMode: BlendMode.color,
        shaderCallback: (rect) => SweepGradient(
          startAngle: 0,
          endAngle: math.pi,
          colors: [
            Colors.blue,
            Colors.red,
          ],
          transform: GradientRotation(math.pi / 2),
        ).createShader(rect),
        child: Image.network(urlImage, fit: BoxFit.cover),
      );
}
