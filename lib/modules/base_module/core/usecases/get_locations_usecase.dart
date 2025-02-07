import '../../../../core/_core.dart';
import '../_core.dart';

class GetLocationsUseCase {
  final BaseOnlineRepository _onlineRepository;
  GetLocationsUseCase(this._onlineRepository);

  Future<Map<String, List<LocationEntity>>> call() async {
    var locationsObtained = await _onlineRepository.getLocations();
    var locationsFromZone = <String, List<LocationEntity>>{};
    locationsObtained.map((a) {
      locationsFromZone[a.zone] = locationsObtained.where((e) => a.zone == e.zone).toList();
    }).toList();
    return locationsFromZone;
  }
}
