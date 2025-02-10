import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../_core.dart';

extension ClientExtension on http.Client {
  dynamic treatment(int statusCode, List<int> bodyBytes) {
    if (statusCode < 200 || statusCode > 299) {
      throw http.ClientException('responseError: $statusCode');
    }
    var jsonData = json.decode(utf8.decode(bodyBytes));
    if (!jsonData['sucesso']) {
      var messages = ((jsonData['mensagem'] as List?)??[]).map((e)=>e as String).toList();
      throw ApiFailure(messages);
    }
    return jsonData;
  }
}
