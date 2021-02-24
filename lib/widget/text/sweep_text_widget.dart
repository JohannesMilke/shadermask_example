import 'dart:math' as math;

import 'package:flutter/material.dart';

class SweepTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) => SweepGradient(
            startAngle: 0,
            endAngle: math.pi * 2,
            colors: [
              Colors.red,
              Colors.purple,
            ],
          ).createShader(rect),
          child: Center(
            child: Text(
              'This is a text with SweepGradient Shader',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
