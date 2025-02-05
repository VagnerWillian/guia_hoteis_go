import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../_shared/_shared.dart';

class GenericPage extends StatefulWidget {
  final String name;
  const GenericPage({this.name = 'Generico', super.key});

  @override
  State<GenericPage> createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).textTheme.bodySmall?.color),
        leading: IconButton(
          onPressed: Modular.to.pop,
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 80),
          child: Text(
            widget.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
