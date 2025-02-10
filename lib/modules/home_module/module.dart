import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import 'blocs/_blocs.dart';
import 'core/domain/repositories/online_repository.dart';
import 'core/infra/repositories/_repositories.dart';
import 'core/usecases/_usecases.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // UseCases
    i
      ..addLazySingleton<HomeOnlineRepository>(() => HomeApiRepository(Modular.get()))

      // UseCases
      ..addLazySingleton(() => GetMotelsUseCase(Modular.get()))

      // Blocs
      ..addLazySingleton(() => HomeBloc(Modular.get(), Modular.get()));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.baseRoute,
      child: (_) => HomePage(Modular.get()),
    );
  }
}
