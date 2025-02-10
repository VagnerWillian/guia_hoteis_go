import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/_shared.dart';
import '../../../base_module/blocs/_blocs.dart';
import '../../blocs/_blocs.dart';
import '../components/_components.dart';

class HomePage extends StatelessWidget {
  final HomeBloc homeBloc;
  const HomePage(this.homeBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (oldState, newState) =>
        oldState.failure == null || newState.failure != oldState.failure,
        listener: (context, state) async {
          if (state.failure != null) {
            MyToasts.showToastError(
              title: state.failure!.title,
              description: state.failure!.message,
            );
          }
        },
        child:  BlocBuilder<BaseBloc, BaseState>(
          bloc: homeBloc.baseBloc,
          builder: (context, state) {
            if (state.selectedLocation != null) homeBloc.add(GetMotelsListEvent());
            if (state.selectedLocation == null) return const StartCard();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const OfferCard(),
                  FilterBar(homeBloc),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<HomeBloc, HomeState>(
                      bloc: homeBloc,
                      builder: (context, state) {
                        return Visibility(
                          visible: !state.loading,
                          replacement: const MotelCardShimmer(),
                          child: ListView.builder(
                            itemCount: homeBloc.state.motels.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return MotelCard(homeBloc.state.motels[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
