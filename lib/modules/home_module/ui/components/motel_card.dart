import 'package:flutter/material.dart';

import '../../../../core/_core.dart';
import '_components.dart';

class MotelCard extends StatelessWidget {
  final MotelEntity _motel;

  const MotelCard(this._motel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          MotelHeader(motel: _motel),
          SuiteSlider(suites: _motel.suites),
        ],
      ),
    );
  }
}
