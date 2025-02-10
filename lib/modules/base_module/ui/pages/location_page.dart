import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/_core.dart';
import '../../blocs/_blocs.dart';

class LocationPage extends StatelessWidget {
  final BaseBloc _baseBloc;
  const LocationPage(this._baseBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    _baseBloc.add(InitializeBaseEvent());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        leading: IconButton(
          onPressed: Modular.to.pop,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.grey.shade600,
          ),
        ),
        title: Text(
          'regiões disponíveis',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 60),
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListTile(
              title: Text(
                'usar minha localização',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              trailing: BlocSelector<BaseBloc, BaseState, bool>(
                bloc: _baseBloc,
                selector: (state)=>state.activateMyLocation,
                builder: (context, activateMyLocation) {
                  return SizedBox(
                    width: 45,
                    height: 35,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        value: activateMyLocation,
                        onChanged: (v) => _baseBloc.add(ChangeSwitchMyLocationEvent(value: v)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocSelector<BaseBloc, BaseState, bool>(
        bloc: _baseBloc,
        selector: (state)=>state.loading,
        builder: (context, loading) {
          if (loading) {
            return const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            child: BlocSelector<BaseBloc, BaseState, Map<String, List<LocationEntity>>>(
              bloc: _baseBloc,
              selector: (state)=>state.locations,
              builder: (context, locations) {
                return Column(
                  children: locations.keys.map((zone) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(20),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Text(
                            zone,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        BlocSelector<BaseBloc, BaseState, LocationEntity?>(
                          bloc: _baseBloc,
                          selector: (state)=>state.selectedLocation,
                          builder: (context, selectedLocation) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: locations[zone]!.length,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return RadioListTile(
                                  value: locations[zone]![index],
                                  title: Text(
                                    locations[zone]![index].location,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  groupValue: selectedLocation,
                                  onChanged: (v) => _baseBloc.add(
                                    ChangeLocationEvent(location: locations[zone]![index]),
                                  ),
                                  controlAffinity: ListTileControlAffinity.trailing,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
