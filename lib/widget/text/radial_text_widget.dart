import 'package:flutter/material.dart';

class RadialTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) => RadialGradient(
            colors: [
              Colors.yellow,
              Colors.red,
            ],
          ).createShader(rect),
          child: Center(
            child: Text(
              'This is a text with RadialGradient Shader',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
