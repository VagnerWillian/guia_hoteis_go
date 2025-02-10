import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import '../_modules.dart';
import 'blocs/base_bloc.dart';
import 'core/_core.dart';
import 'ui/pages/_pages.dart';

class BaseModule extends Module {
  @override
  void binds(Injector i) {
    // Repositories
    i
      ..addLazySingleton<BaseOnlineRepository>(() => BaseApiRepository(Modular.get()))

      // UseCases
      ..addLazySingleton(() => GetLocationsUseCase(i.get()))

    //Blocs
    ..addLazySingleton(() => BaseBloc(i.get()));
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        AppRoutes.baseRoute,
        child: (_) => BasePage(Modular.get()),
        transition: TransitionType.fadeIn,
        duration: const Duration(seconds: 1),
        children: [
          ModuleRoute(AppRoutes.homeRoute, module: HomeModule()),
        ],
      )
      ..child(
        AppRoutes.genericRoute(),
        child: (_) => GenericPage(name: Modular.args.data),
        transition: TransitionType.rightToLeft,
        duration: const Duration(milliseconds: 200),
      )
      ..child(
        AppRoutes.locationRoute,
        child: (_) => LocationPage(Modular.get()),
        transition: TransitionType.downToUp,
      );
  }
}
