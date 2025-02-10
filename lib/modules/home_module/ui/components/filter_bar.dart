import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/_blocs.dart';

class FilterBar extends StatelessWidget {
  final HomeBloc _homeBloc;
  const FilterBar(this._homeBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.only(left: 10),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Badge(
                  alignment: Alignment.topLeft,
                  offset: const Offset(5,0),
                  isLabelVisible: state.filters.keys.isNotEmpty && !state.loading,
                  label: Text('${state.filters.keys.length}'),
                  child: ActionChip(
                    onPressed: state.loading ? null : () {},
                    avatar: const Icon(Icons.tune),
                    label: const Text('filtros'),
                  ),
                ),
                _buildChip(key: 'com desconto', enabled: !state.loading),
                _buildChip(key: 'disponíveis', enabled: !state.loading),
                _buildChip(key: 'hidro', enabled: !state.loading),
                _buildChip(key: 'piscina', enabled: !state.loading),
                _buildChip(key: 'sauna', enabled: !state.loading),
                _buildChip(key: 'ofurô', enabled: !state.loading),
                _buildChip(key: 'decoração erótica', enabled: !state.loading),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildChip({required String key, bool enabled = true}) {
    var selected = _homeBloc.state.filters.containsKey(key);
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: ChoiceChip(
        label: Text(key),
        showCheckmark: false,
        selected: !enabled ? false : _homeBloc.state.filters.containsKey(key),
        side: selected && enabled ? BorderSide.none : null,
        onSelected: !enabled ? null : (v) {
          _homeBloc..add(UpdateFilterEvent(key: key, value: '$v'))
          ..add(GetMotelsListEvent());
        },
      ),
    );
  }
}
