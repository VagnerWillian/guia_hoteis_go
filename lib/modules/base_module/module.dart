import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import '../_modules.dart';
import 'ui/pages/base_page.dart';

class BaseModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.baseRoute,
      child: (_) => const BasePage(),
      children: [
        ModuleRoute(AppRoutes.homeRoute, module: HomeModule()),
      ],
    );
  }
}
