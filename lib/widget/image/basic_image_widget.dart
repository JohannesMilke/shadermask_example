import 'package:flutter/material.dart';

import '../../main.dart';

class BasicImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Image.network(urlImage, fit: BoxFit.cover);
}
