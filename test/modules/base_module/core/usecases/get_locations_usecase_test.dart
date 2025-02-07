import 'package:app/core/failures/app_failure.dart';
import 'package:app/core/failures/network_failure.dart';
import 'package:app/modules/base_module/core/_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_data.dart';

class MockOnlineRepository extends Mock implements BaseOnlineRepository {}

void main() {
  late BaseOnlineRepository mockOnlineRepository;
  late GetLocationsUseCase useCase;

  setUp(() {
    mockOnlineRepository = MockOnlineRepository();
    useCase = GetLocationsUseCase(mockOnlineRepository);
  });

  tearDown((){
    reset(mockOnlineRepository);
  });

  group('Success Cases', (){
    test('Should be return as Map with zone and locations', () async {
      // Arrange
      when(() => mockOnlineRepository.getLocations()).thenAnswer((_) async => mockLocationsModel);

      // Action
      var result = await useCase();

      // Expect
      expect(result, mockLocationsMap);
    });

    test('Should be call repository only one time', () async {
      // Arrange
      when(() => mockOnlineRepository.getLocations()).thenAnswer((_) async => mockLocationsModel);

      // Action
      await useCase();

      // Expect
      verify(()=>mockOnlineRepository.getLocations()).called(1);
    });

    test('Should be return as Map empty', () async {
      // Arrange
      when(() => mockOnlineRepository.getLocations()).thenAnswer((_) async => []);

      // Action
      var result = await useCase();

      // Expect
      expect(result, {});
    });
  });

  group('Fails Cases', () {
    test('Should be return NetworkFailure', () {
      // Arrange
      when(() => mockOnlineRepository.getLocations()).thenThrow(NetworkFailure());

      // Action
      var result = useCase();

      // Expect
      expect(result, throwsA(isA<NetworkFailure>()));
    });

    test('Should be return FailureApp', () {
      // Arrange
      when(() => mockOnlineRepository.getLocations()).thenThrow(AppFailure());

      // Action
      var result = useCase();

      // Expect
      expect(result, throwsA(isA<AppFailure>()));
    });
  });


}

