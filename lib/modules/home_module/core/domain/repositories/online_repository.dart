import '../../../../../core/_core.dart';

abstract class HomeOnlineRepository{
  Future<MotelPaginationEntity> getAllMotels(Map<String, dynamic> query);
}