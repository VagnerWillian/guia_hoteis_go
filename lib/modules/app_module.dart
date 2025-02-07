import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../core/_core.dart';
import '_modules.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(http.Client());
  }

  @override
  void routes(RouteManager r) {
    r
      ..module(
        AppRoutes.baseRoute,
        module: BaseModule(),
      )
      ..module(AppRoutes.splashRoute, module: SplashModule());
  }
}
