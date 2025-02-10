import 'dart:convert';

import 'package:app/core/_core.dart';
import 'package:app/modules/home_module/core/infra/repositories/_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../mock_data.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late HomeApiRepository apiRepository;
  late MockClient mockClient;

  var (filters, location) = ({'filter': 'value'}, '');

  setUp(() {
    mockClient = MockClient();
    apiRepository = HomeApiRepository(mockClient);
    registerFallbackValue(Uri.parse('https://dummy-url.com'));
  });

  tearDown(() {
    reset(mockClient);
  });

  group('Success Cases', () {
    test('Should be return Pagination with motels', () async {
      // Arrange
      when(() => mockClient.get(any())).thenAnswer(
        (_) async => http.Response(mockPaginationJson, 200),
      );

      // Action
      var response = await apiRepository.getAllMotels(filters, location);

      // Assert
      expect(response, mockPagination);
      verify(() => mockClient.get(any())).called(1);
    });

    test('Verify if request has query params', () async {
      var url = Uri.parse(EndPoints.getMotelsEP).replace(queryParameters: filters);
      // Arrange
      when(() => mockClient.get(url)).thenAnswer(
        (_) async => http.Response(mockPaginationJson, 200),
      );

      // Action
      await apiRepository.getAllMotels(filters, location);

      // Assert
      verify(() => mockClient.get(url)).called(1);
    });
  });

  group('Fails Cases', () {
    test('Should be return a throw NetworkFailure if status code < 200', () async {
      // Arrange
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockPaginationJson, 199));

      // Act
      var result = apiRepository.getAllMotels({}, '');

      // Assert
      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('Should be return a throw NetworkFailure if status code > 299', () async {
      // Arrange
      when(
        () => mockClient.get(
          any(),
        ),
      ).thenAnswer((_) async => http.Response(mockPaginationJson, 300));

      // Act
      var result = apiRepository.getAllMotels(filters, location);

      // Assert
      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('Should be return a throw FailureApp if body is empty', () async {
      // Arrange
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('', 200));

      // Act
      var result = apiRepository.getAllMotels(filters, location);

      // Assert
      expect(result, throwsA(isA<AppFailure>()));
    });

    test('Should be return a throw FailureApp if any exception', () async {
      // Arrange
      when(
        () => mockClient.get(any()),
      ).thenThrow((_) async => Exception());

      // Act
      var result = apiRepository.getAllMotels(filters, location);

      // Assert
      expect(result, throwsA(isA<AppFailure>()));
    });

    test('Should be return a throw ApiFailure with string message of api', () async {
      // Arrange
      when(() => mockClient.get(any())).thenAnswer((_) async => http.Response(apiReturn, 200));

      // Act
      try {
        await apiRepository.getAllMotels(filters, location);
      } on ApiFailure catch (e) {
        // Assert
        expect(e, isA<ApiFailure>());
        expect(e.message, messagesString);
      }
    });

    test('Should be return a throw AppFailure if success of api is true, but with invalid data',
        () async {
      var api = apiReturnData['sucesso'] = true;
      // Arrange
      when(() => mockClient.get(any()))
          .thenAnswer((_) async => http.Response(jsonEncode(api), 200));

      // Act
      var response = apiRepository.getAllMotels(filters, location);
      // Assert
      expect(response, throwsA(isA<AppFailure>()));
    });
  });
}
