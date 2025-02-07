import 'package:http/http.dart' as http;

import 'app_failure.dart';
import 'network_failure.dart';

class HandleFailures {
  static Object identify(Object e, StackTrace s) {
    if (e is http.ClientException) {
      return NetworkFailure(error: e.message);
    } else {
      return AppFailure();
    }
  }
}
