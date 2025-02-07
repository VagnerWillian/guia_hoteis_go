import '../../../../../core/_core.dart';

abstract class BaseOnlineRepository{
  Future<List<LocationEntity>> getLocations();
}