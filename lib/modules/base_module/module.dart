import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import '../_modules.dart';
import 'ui/pages/base_page.dart';
import 'ui/pages/generic_page.dart';

class BaseModule extends Module {
  @override
  void routes(RouteManager r) {
    r
      ..child(
        AppRoutes.baseRoute,
        child: (_) => const BasePage(),
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
        duration: const Duration(milliseconds: 200)
      );
  }
}
