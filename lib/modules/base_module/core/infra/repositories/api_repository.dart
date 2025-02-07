import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../_shared/_shared.dart';
import '../../../../../core/_core.dart';
import '../../../../../core/failures/handle_failure.dart';
import '../../domain/repositories/_repositories.dart';

class BaseApiRepository implements BaseOnlineRepository {
  final http.Client _client;
  BaseApiRepository(this._client);
  @override
  Future<List<LocationEntity>> getLocations() async {
    try {
      var response = await _client.get(
        Uri.parse(EndPoints.getLocationsEP),
        headers: {'Authorization': 'Bearer ${EndPoints.token}'},
      );
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw http.ClientException('responseError: ${response.statusCode}');
      }
      return (json.decode(response.body) as List).map((e) => Location.fromJson(e)).toList();
    } catch (e, s) {
      print(e);
      throw HandleFailures.identify(e, s);
    }
  }
}
