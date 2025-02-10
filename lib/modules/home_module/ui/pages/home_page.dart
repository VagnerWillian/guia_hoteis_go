import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OfferCard(),
            FilterBar(_homeBloc),
            BlocBuilder<HomeBloc, HomeState>(
              bloc: _homeBloc,
              builder: (context, state) {
                return Visibility(
                  visible: !state.loading,
                  replacement: const MotelCardShimmer(),
                  child: ListView.builder(
                    itemCount: _homeBloc.state.motels.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return MotelCard(_homeBloc.state.motels[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
