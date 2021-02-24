import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadermask_example/main.dart';

class ImageTextWidget extends StatelessWidget {
  Future<ui.Image> _loadImage() async {
    final imageBytes = await rootBundle.load('assets/example.jpg');
    return decodeImageFromList(imageBytes.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) => Container(
        child: FutureBuilder<ui.Image>(
          future: _loadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final image = snapshot.data;

              return ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (rect) => ImageShader(
                  image,
                  TileMode.mirror,
                  TileMode.mirror,
                  Matrix4.identity().storage,
                ),
                child: Center(
                  child: Text(
                    'This is a text with ImageShader',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
          },
        ),
      );
}
