class AppRoutes {
  static const baseRoute = '/';
  static const homeRoute = '/inicio/';
  static const splashRoute = '/carregando/';

  static String genericRoute({String? name}) => name == null ? '/:name' : '/$name';
}
