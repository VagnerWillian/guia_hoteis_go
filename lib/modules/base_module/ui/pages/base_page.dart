import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Base'),),
      body: const RouterOutlet(),
    );
  }
}
