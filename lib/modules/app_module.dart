import 'package:flutter_modular/flutter_modular.dart';

import '../core/_core.dart';
import '_modules.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      AppRoutes.baseRoute,
      module: BaseModule(),
    );
  }
}
