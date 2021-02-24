import 'package:flutter/material.dart';

class LinearTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.green,
              ],
            ).createShader(rect),
            child: Text(
              'This is a text with LinearGradient Shader',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
