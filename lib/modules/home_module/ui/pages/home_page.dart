import 'package:flutter/material.dart';

import '../../blocs/_blocs.dart';
import '../components/_components.dart';

class HomePage extends StatelessWidget {
  final HomeBloc _homeBloc;
  const HomePage(this._homeBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OfferCard(),
            FilterBar(_homeBloc),
            const MotelCard(),
          ],
        ),
      ),
    );
  }
}
