import 'package:app/_shared/_shared.dart';
import 'package:app/core/failures/app_failure.dart';
import 'package:app/core/failures/network_failure.dart';
import 'package:app/modules/base_module/blocs/_blocs.dart';
import 'package:app/modules/base_module/core/_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_data.dart';

class GetLocationsUseCaseMock extends Mock implements GetLocationsUseCase {}
class MockMyToasts extends Mock implements MyToasts {}

void main() {
  late GetLocationsUseCase getLocationsUseCaseMock;
  late BaseBloc baseBloc;

  setUp(() {
    getLocationsUseCaseMock = GetLocationsUseCaseMock();
    baseBloc = BaseBloc(getLocationsUseCaseMock);
  });

  tearDown(() {
    baseBloc.close();
    reset(getLocationsUseCaseMock);
  });

  group('Success Cases', () {
    test('Bloc initial state', () {
      expect(baseBloc.state.locations, {});
      expect(baseBloc.state.loading, true);
      expect(baseBloc.state.selectedLocation, null);
      expect(baseBloc.state.activateMyLocation, false);
    });

    test('Add InitialEvent when load all locations with success', () {
      // Arrange
      when(() => getLocationsUseCaseMock()).thenAnswer((_) async => mockLocationsMap);
      baseBloc.add(InitializeBaseEvent());

      // Assert
      expectLater(
        baseBloc.stream,
        emitsInOrder(
          [
            baseBloc.state.copyWith(loading: true),
            baseBloc.state.copyWith(locations: mockLocationsMap, loading: true),
            baseBloc.state.copyWith(locations: mockLocationsMap, loading: false),
          ],
        ),
      );
    });

    test('Add InitialEvent when load all locations with any failure', () {
      // Arrange
      var failure = AppFailure();
      when(() => getLocationsUseCaseMock()).thenThrow(failure);
      baseBloc.add(InitializeBaseEvent());

      // Assert
      expectLater(
        baseBloc.stream,
        emitsInOrder(
          [
            baseBloc.state.copyWith(loading: true),
            baseBloc.state.copyWith(loading: false),
            baseBloc.state.copyWith(loading: false, failure: failure),
          ],
        ),
      );
    });

    test('Add InitialEvent when load all locations with any networkFailure', () {
      // Arrange
      var failure = NetworkFailure();
      when(() => getLocationsUseCaseMock()).thenThrow(failure);
      baseBloc.add(InitializeBaseEvent());

      // Assert
      expectLater(
        baseBloc.stream,
        emitsInOrder(
          [
            baseBloc.state.copyWith(loading: true),
            baseBloc.state.copyWith(loading: false),
            baseBloc.state.copyWith(loading: false, failure: failure),
          ],
        ),
      );
    });

    test('turn ON switch myLocation ', () {
      // Action
      baseBloc.add(ChangeSwitchMyLocationEvent(value: true));

      // Assert
      expectLater(baseBloc.stream, emits(baseBloc.state.copyWith(activateMyLocation: true)));
    });

    test('turn OFF switch myLocation ', () {
      // Action
      baseBloc.add(ChangeSwitchMyLocationEvent(value: false));

      // Assert
      expectLater(baseBloc.stream, emits(baseBloc.state.copyWith(activateMyLocation: false)));
    });
  });
}
