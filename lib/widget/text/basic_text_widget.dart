import 'package:flutter/material.dart';

class BasicTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'This is a text with RadialGradient Shader',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
