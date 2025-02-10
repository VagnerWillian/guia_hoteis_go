import 'package:http/http.dart' as http;

import '../../../../../_shared/_shared.dart';
import '../../../../../core/_core.dart';
import '../../../../../core/utils/extensions/client_extension.dart';
import '../../domain/repositories/online_repository.dart';

class HomeApiRepository implements HomeOnlineRepository {
  final http.Client _client;
  HomeApiRepository(this._client);

  @override
  Future<MotelPaginationEntity> getAllMotels(Map<String, String> query, String location) async {
    try {
      var response = await _client.get(
        Uri.parse(EndPoints.getMotelsEP).replace(queryParameters: query),
      );
      var jsonData = _client.treatment(response.statusCode, response.bodyBytes);
      return MotelPagination.fromJson(jsonData['data']);
    } catch (e, s) {
      throw HandleFailures.identify(e, s);
    }
  }
}
