import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadermask_example/main.dart';

class ImageShaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: FutureBuilder<ui.Image>(
          future: loadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final image = snapshot.data;

              return ShaderMask(
                blendMode: BlendMode.overlay,
                shaderCallback: (rect) => ImageShader(
                  image,
                  TileMode.mirror,
                  TileMode.mirror,
                  Matrix4.identity().storage,
                ),
                child: Image.network(urlImage, fit: BoxFit.cover),
              );
            }
          },
        ),
      );

  Future<ui.Image> loadImage() async {
    final imageBytes = await rootBundle.load('assets/example.jpg');

    return decodeImageFromList(imageBytes.buffer.asUint8List());
  }
}
