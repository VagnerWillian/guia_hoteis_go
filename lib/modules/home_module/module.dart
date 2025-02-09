import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import 'blocs/_blocs.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => HomeBloc());
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.baseRoute, child: (_) => HomePage(Modular.get()));
  }
}
