
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/_constants.dart';
import '../../blocs/base_bloc.dart';
import '../../blocs/base_state.dart';

class LocateSelectionBar extends StatefulWidget {
  const LocateSelectionBar({super.key});

  @override
  State<LocateSelectionBar> createState() => _LocateSelectionBarState();
}

class _LocateSelectionBarState extends State<LocateSelectionBar> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Modular.to.pushNamed(AppRoutes.locationRoute),
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: DottedDecoration(
            shape: Shape.line,
            linePosition: LinePosition.bottom,
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
          child: BlocBuilder<BaseBloc, BaseState>(
            bloc: Modular.get<BaseBloc>(),
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.selectedLocation==null?'escolha uma região':state.selectedLocation!.location,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.surfaceBright,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.surfaceBright,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
