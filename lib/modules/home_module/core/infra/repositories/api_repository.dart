import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../_shared/_shared.dart';
import '../../../../../core/_core.dart';
import '../../../../../core/failures/handle_failure.dart';
import '../../domain/repositories/online_repository.dart';

class HomeApiRepository implements HomeOnlineRepository {
  final http.Client _client;
  HomeApiRepository(this._client);

  @override
  Future<MotelPaginationEntity> getAllMotels(Map<String, dynamic> query) async {
    try {
      var response = await _client.get(
        Uri.parse(EndPoints.getMotelsEP),
      );
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw http.ClientException('responseError: ${response.statusCode}');
      }
      return MotelPagination.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);
    } catch (e, s) {
      throw HandleFailures.identify(e, s);
    }
  }
}
