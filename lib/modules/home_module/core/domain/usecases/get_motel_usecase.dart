import '../../../../../core/_core.dart';
import '../repositories/online_repository.dart';

class GetMotelsUseCase {
  final HomeOnlineRepository _onlineRepository;
  GetMotelsUseCase(this._onlineRepository);

  Future<MotelPaginationEntity> call({Map<String, dynamic> query = const {}}) async {
    return await _onlineRepository.getAllMotels(query);
  }
}
