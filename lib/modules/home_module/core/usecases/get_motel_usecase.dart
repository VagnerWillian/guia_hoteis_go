import '../../../../../core/_core.dart';
import '../domain/repositories/_repositories.dart';

class GetMotelsUseCase {
  final HomeOnlineRepository _onlineRepository;
  GetMotelsUseCase(this._onlineRepository);

  Future<MotelPaginationEntity> call({
    Map<String, String> query = const {},
    required String location,
  }) async {
    return await _onlineRepository.getAllMotels(query, location);
  }
}
