import 'package:http/http.dart' as http;

import '../_core.dart';

class HandleFailures {
  static Object identify(Object e, StackTrace s) {
    if (e is http.ClientException) {
      return NetworkFailure(error: e.message);
    } else if(e is ApiFailure){
      return e;
    } else {
      return AppFailure();
    }
  }
}
