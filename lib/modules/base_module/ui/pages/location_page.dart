import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../blocs/_blocs.dart';

class LocationPage extends StatelessWidget {
  final BaseBloc _baseBloc;
  const LocationPage(this._baseBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    _baseBloc.add(InitializeEvent());
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        backgroundColor: const Color(0xFFF8F9fB),
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
              trailing: BlocBuilder<BaseBloc, BaseState>(
                bloc: _baseBloc,
                builder: (context, state) {
                  return SizedBox(
                    width: 45,
                    height: 35,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        value: state.activateMyLocation,
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
      backgroundColor: const Color(0xFFF8F9fB),
      body: BlocBuilder<BaseBloc, BaseState>(
        bloc: _baseBloc,
        builder: (context, state) {
          if (state.loading) {
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
            child: Column(
              children: state.locations.keys.map((zone) {
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.locations[zone]!.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return RadioListTile(
                          value: state.locations[zone]![index],
                          title: Text(
                            state.locations[zone]![index].location,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          groupValue: state.selectedLocation,
                          onChanged: (v) => _baseBloc.add(
                            ChangeLocationEvent(location: state.locations[zone]![index]),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
