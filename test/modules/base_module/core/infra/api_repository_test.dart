import 'package:app/core/failures/app_failure.dart';
import 'package:app/core/failures/network_failure.dart';
import 'package:app/modules/base_module/core/_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../mock_data.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late BaseApiRepository apiRepository;

  setUp(() {
    mockClient = MockClient();
    apiRepository = BaseApiRepository(mockClient);
    registerFallbackValue(Uri.parse('https://dummy-url.com'));
  });

  tearDown(() {
    reset(mockClient);
  });


  group('Success Cases', () {
    test('getShould be return list from locations', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer((_) async => http.Response(mockLocationJson, 200));

      // Act
      var result = await apiRepository.getLocations();

      // Assert
      expect(result, mockLocationsModel);

      verify(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).called(1);
    });
  });

  group('Fails Cases', () {
    test('getShould be return a throw NetworkFailure if status code < 200', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer((_) async => http.Response(mockLocationJson, 199));

      // Act
      var result = apiRepository.getLocations();

      // Assert
      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('getShould be return a throw NetworkFailure if status code > 299', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer((_) async => http.Response(mockLocationJson, 300));

      // Act
      var result = apiRepository.getLocations();

      // Assert
      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('getShould be return a throw FailureApp if body is empty', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer((_) async => http.Response('', 200));

      // Act
      var result = apiRepository.getLocations();

      // Assert
      expect(result, throwsA(isA<AppFailure>()));
    });

    test('getShould be return a throw FailureApp if any exception', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
          headers: any(named: 'headers'),
        ),
      ).thenThrow((_) async => Exception());

      // Act
      var result = apiRepository.getLocations();

      // Assert
      expect(result, throwsA(isA<AppFailure>()));
    });
  });
}
