import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/_core.dart';
import 'ui/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.baseRoute,
      child: (_) => const SplashPage(),

    );
  }
}
