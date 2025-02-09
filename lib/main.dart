import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'modules/_modules.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;

    return ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    );
  }
}
