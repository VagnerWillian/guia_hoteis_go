import 'package:app/core/_core.dart';
import 'package:app/modules/home_module/core/domain/repositories/_repositories.dart';
import 'package:app/modules/home_module/core/usecases/_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_data.dart';

class OnlineRepositoryMock extends Mock implements HomeOnlineRepository {}

void main() {
  late GetMotelsUseCase getMotelsUseCase;
  late HomeOnlineRepository onlineRepositoryMock;

  var (filter, location) = ({'filter1': 'true', 'filter2': 'false'}, 'location');
  var (filterEmpty, locationEmpty) = (<String, String>{}, '');

  setUp(() {
    onlineRepositoryMock = OnlineRepositoryMock();
    getMotelsUseCase = GetMotelsUseCase(onlineRepositoryMock);
  });

  tearDown(() {
    reset(onlineRepositoryMock);
  });

  group('Sucess Cases', () {
    test('Should be return list of Motels', () async {
      // Arrange
      when(() => onlineRepositoryMock.getAllMotels({}, '')).thenAnswer((_) async => mockPagination);

      // Action
      var response = await getMotelsUseCase(query: {}, location: '');

      // Assert
      expect(response, mockPagination);
      expect(response.motels.length, 1);
      expect(response.motels.first.suites.length, 2);
      expect(response.totalMotels, 1);
      expect(response.totalSuites, 2);
      verify(() => onlineRepositoryMock.getAllMotels({}, '')).called(1);
    });

    test('Should be return list of Motels with filters and location', () async {
      // Arrange
      when(() => onlineRepositoryMock.getAllMotels(filter, location))
          .thenAnswer((_) async => mockPagination);

      // Action
      await getMotelsUseCase(query: filter, location: location);

      // Assert
      verify(() => onlineRepositoryMock.getAllMotels(filter, location)).called(1);
    });
  });

  group('Fails Cases', () {
    test('Should be throw a NetworkFailure', () async {
      // Arrange
      when(() => onlineRepositoryMock.getAllMotels(filterEmpty, locationEmpty))
          .thenThrow(NetworkFailure());

      // Action
      var result = getMotelsUseCase(query: filterEmpty, location: locationEmpty);

      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('Should be throw a FailureApp', () async {
      // Arrange
      when(() => onlineRepositoryMock.getAllMotels(filterEmpty, locationEmpty))
          .thenThrow(AppFailure());

      // Action
      var result = getMotelsUseCase(query: filterEmpty, location: locationEmpty);

      expect(result, throwsA(isA<AppFailure>()));
    });

    test('Should be throw a ApiFailure', () async {
      // Arrange
      when(() => onlineRepositoryMock.getAllMotels(filterEmpty, locationEmpty))
          .thenThrow(ApiFailure([]));

      // Action
      var result = getMotelsUseCase(query: filterEmpty, location: locationEmpty);

      expect(result, throwsA(isA<ApiFailure>()));
    });
  });
}